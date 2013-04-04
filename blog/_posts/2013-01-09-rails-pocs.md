---
layout: post
title: Rails PoC exploits for CVE-2013-0156 and CVE-2013-0155
author: postmodern
tags:
 - rails
 - ronin
 - poc
 - exploit
---

**TL;DR:** Exploits are out, update Rails!

* [rails_dos.rb]
* [rails_jsonq.rb]
* [rails_sqli.rb]
* [rails_rce.rb]

On January 8th, Aaron Patterson announced [CVE-2013-0156],
multiple vulnerabilities in parameter parsing in Action Pack allowing attackers
to:

* Bypass Authentication systems
* Inject Arbitrary SQL
* Perform a Denial of Service (DoS)
* Execute arbitrary code

However, rumors of this vulnerability had been circulating on twitter as far
back as [CVE-2012-5664]. Others also claimed to have [working PoC exploits],
but would not release them for fear of the PoCs being used maliciously.
Naturally, I was interested in investigating the vulnerability.

It all started when [Phenoelit] discovered a vulnerability
in how authentication plugins (such as AuthLogic) pass parameters to
`find_by_*` methods. [CVE-2012-5664] was then posted, stirring Twitter into
a frenzy. However, the possibility of exploitation was limited, as detailed
on the [Phusion Corporate Blog]. Thus the hunt began.

## Intro to params in Rails

Params are first parsed by [ActionDispatch::Middleware::ParamsParser][ParamsParser], which detects the MIME type of the request and parses the body
appropriately. By default [ParamsParser] only supports parsing XML and JSON
requests. After the request body is parsed, the resulting data is coerced
into a [HashWithIndifferentAccess], ensuring all Hash keys are Strings.

Next, [ActionDispatch::Http::Parameters][Parameters] takes the parsed request
parameters and merges them with the path parameters. Note that the path
parameters are first merged into the request parameters, to ensure that the
request parameters cannot override the path parameters. Also note that when a
Hash is merged into a [HashWithIndifferentAccess], all keys are converted to
Strings and all sub-Hashes converted to Indifferent ones. This ensures that
`params` contains no Symbol keys and cannot be passed to `find_by_*` methods;
despite what [CVE-2012-5664] claims.

## XML Deserialization

The Rails XML module ([ActiveSupport::XmlMini][XmlMini]) supports deserializing
various primitives such as Integer, Symbol, String, Date, Time, etc. However,
[XmlMini] also supports deserializing embedded YAML blobs. One might wonder,
why this would be a good idea? Apparently, to support [serializing/deserializing
ActiveRecord models that contain serialized YAML][7502].

What can we do with this? Deserialize arbitrary Objects for Classes already
loaded by the Rails application.

## YAML

When [Psych] parses `!ruby/object:MyClass` objects, it will call
`MyClass.allocate` which returns a blank uninitialized instances of `MyClass`.
Next, Psych will call `instance_variable_set` to set various instance variables.

Interestingly, [Psych] allows for arbitrary classes to be specified with
`!ruby/string` and `!ruby/hash` declarations:

{% highlight yaml %}
!ruby/hash:MyHashLikeClass
key1: value1
key2: value2
{% endhighlight %}

When [Psych] parses `!ruby/hash:Class`, it will actually call `#initialize`
and then call `#[]=` to populate the objects fields. This feature was
[added](https://github.com/ruby/ruby/commit/8cd2bf072180a9f733ac06dbaa96f071ca8e8303)
sometime after Ruby 1.9.2.

## PoCs

The Proof of Concept (PoC) exploits rely on abusing the [Psych] YAML parser
and how it allows specifying arbitrary classes for `!ruby/string` and
`!ruby/hash` YAML objects.

All of the following PoCs require the [ronin-support] gem and licensed under
[GPLv3].

### Symbol DoS

[rails_dos.rb]

The Denial of Service vulnerability relies on the fact that even in Ruby 1.9
Symbols are not Garbage Collected. Even if [HashWithIndifferentAccess]
converts the Symbols to Strings, the Symbols will remain in memory.

All we have to do is repeatedly send requests containing unique Symbols.
To accomplish this we use the [String.generate] method to generate
alphabetic Symbol names of varying length.

### Unsafe Query Generation via JSON

[rails_jsonq.rb]

[ActionDispatch::Middleware::ParamsParser][ParamsParser] also supports parsing
JSON params from requests. However, it does not normalize the parsed params.
Values such as `[nil]` or `[""]` are not normalized to `nil` and `""`.
This allows us to bypass `#nil?` or `#empty?` checks, such as described
in [CVE-2013-0155]:

{% highlight ruby %}
unless params[:token].nil?
  user = User.find_by_token(params[:token])
  user.reset_password!
end
{% endhighlight %}

### SQL Injection

[rails_sqli.rb]

Knowing that we cannot simply craft a XML+YAML request containing the `:select`
option with some raw SQL, we have to look for an alternate code-path.
As the [Insinuator] blog post points out, `find_by_*` methods can actually
accept `Arel::Node` objects! Potentially, we can inject any of the
[Arel::Nodes]. The most promising of these is [Arel::Nodes::SqlLiteral].
Unfortunately, calling `Arel::Nodes::SqlLiteral#to_yaml` does not work,
so we must hand craft specific YAML:

{% highlight yaml %}
--- !ruby/string:Arel::Nodes::SqlLiteral "SQL here"
{% endhighlight %}

Note that since [Arel::Nodes::SqlLiteral] inherits from String,
`!ruby/object:Arel::Nodes::SqlLiteral` actually deserializes to a plain String;
thus `!ruby/string` is necessary.

We could get creative and inject in an Abstract Syntax Tree (AST) of our
desired SQL:

{% highlight yaml %}
--- !ruby/object:Arel::Nodes::Or
left: 0
right: !ruby/object:Arel::Nodes::Equality
  left: 1
  right: 1
{% endhighlight %}

### Remote Code Execution

[rails_rce.rb]

**Update:** The RCE PoC has been updated to support Rails 3.x and 2.x.
Also, [@eric1234](https://gist.github.com/4499206/#comment-718470) discovered
that RCE PoC will not work against Ruby 1.9.2 below, due to Psych <= 1.0.0
not allowing arbitrary classes with `!ruby/hash`. However, there
may be other YAML encoding tricks that could trigger the vulnerability.

As discussed in this [Insinuator] blog post, it may be possible to override an
instance variable that is later passed to `instance_eval`, `class_eval`,
`module_eval` or `send`. One such example is using [ERB]:

{% highlight yaml %}
--- !ruby/object:ERB
src: _erbout = puts 'lol'
{% endhighlight %}

However, this relies on Rails calling `#run` or `#result`. This turns out to be 
rather difficult, since ActiveRecord/Arel will only allow certain types of
objects be passed to `find_by_*` methods.

Since, we know [Psych] will call `#initialize` when parsing `!ruby/hash:MyClass`
we just need to find a Hash like class. Luckily an anonymous contributor
discovered such a class and told the Metasploit developers, which got published
on the [Rapid7 Community] blog. The blog post then circulated Twitter and
a friend pointed me to the class.

**Update:** After publishing the PoCs, [lian] contacted me and
identified himself as the anonymous contributor who told HD Moore about the
class. I then convinced him to take credit for his work on this vulnerability.
Thanks to [lian]'s solution, I was able to finish writing the exploit.
In my opinion, if you give a famous Security Research your own research,
you should publish it yourself to receive proper recognition and inform
us not-so-famous Security researchers. ;)

The class in question is [ActionDispatch::Routing::RouteSet::NamedRouteCollection][NamedRouteCollection].
The class initializes variables in `#initialize` and aliases `#[]=` to the
`add` method. The `add` method then leads to `define_named_route_methods`,
which leads to `define_named_route_methods`, then to `define_url_helper`
and finally `module_eval`. We are in business.

Now to figure out how to escape our Ruby code, such that `def #{name}` is
ignored. Luckily, Ruby provides a special keyword (`__END__`) which causes the
remainder of Ruby code to be treated as inline data.

{% highlight ruby %}
code = "puts 'lol'"
escaped_code = "foo; #{code}\n__END__\n"
{% endhighlight %}

Now we need a convincing `route` Object for [define_url_helper]. Inspecting
the method, our `route` must respond to `defaults`, `requirements`,
`required_parts`, `segment_keys`. Luckily, all of these methods appear
to be reader methods, so we can mock up a `route` using an [OpenStruct].

After some massaging of the YAML, victory! In fact, our method worked
so well that no exceptions were raised and our code is evaluated for each
url helper that is defined (four times):

    lol
    lol
    lol
    lol
    
    Started POST "/secrets/search" for 127.0.0.1 at 2013-01-09 19:35:48 -0800
    Processing by SecretsController#search as */*
      Parameters: {"secret"=>#<ActionDispatch::Routing::RouteSet::NamedRouteCollection:0x007f5474264218 @routes={:"foo; puts 'lol'\n__END__\n"=>#<OpenStruct defaults={:action=>"create", :controller=>"foos"}, required_parts=[], requirements={:action=>"create", :controller=>"foos"}, segment_keys=[:format]>}, @helpers=[:"hash_for_foo; puts 'lol'\n__END__\n_url", :"foo; puts 'lol'\n__END__\n_url", :"hash_for_foo; puts 'lol'\n__END__\n_path", :"foo; puts 'lol'\n__END__\n_path"], @module=#<Module:0x007f54742641a0>>}
    WARNING: Can't verify CSRF token authenticity
    Completed 500 Internal Server Error in 1ms

[CVE-2013-0155]: https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/t1WFuuQyavI
[CVE-2013-0156]: https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/61bkgvnSGTQ
[CVE-2012-5664]: https://groups.google.com/forum/#!topic/rubyonrails-security/DCNTNp_qjFM

[Phenoelit]: http://phenoelit.org/blog/archives/2012/12/21/let_me_github_that_for_you/index.html
[Phusion Corporate Blog]: http://blog.phusion.nl/2013/01/03/rails-sql-injection-vulnerability-hold-your-horses-here-are-the-facts/

[HashWithIndifferentAccess]: https://github.com/rails/rails/blob/v3.2.10/activesupport/lib/active_support/hash_with_indifferent_access.rb
[ParamsParser]: https://github.com/rails/rails/blob/v3.2.10/actionpack/lib/action_dispatch/middleware/params_parser.rb
[Parameters]: https://github.com/rails/rails/blob/v3.2.10/actionpack/lib/action_dispatch/http/parameters.rb
[XmlMini]: https://github.com/rails/rails/blob/v3.2.10/activesupport/lib/active_support/xml_mini.rb#L67
[Psych]: https://github.com/tenderlove/psych/blob/v3.2.10/lib/psych/visitors/to_ruby.rb
[Arel::Nodes]: https://github.com/rails/arel/tree/v3.2.10/lib/arel/nodes
[Arel::Nodes::SqlLiteral]: https://github.com/rails/arel/blob/v3.2.10/lib/arel/nodes/sql_literal.rb
[NamedRouteCollection]: https://github.com/rails/rails/blob/v3.2.10/actionpack/lib/action_dispatch/routing/route_set.rb#L96
[define_url_helper]: https://github.com/rails/rails/blob/v3.2.10/actionpack/lib/action_dispatch/routing/route_set.rb#L187-L203

[ERB]: http://rubydoc.info/stdlib/erb/ERB
[OpenStruct]: http://rubydoc.info/stdlib/ostruct/OpenStruct

[7502]: http://web.archive.org/web/20071218105822/http://dev.rubyonrails.org/ticket/7502
[Insinuator]: http://www.insinuator.net/2013/01/rails-yaml/
[Rapid7 Community]: https://community.rapid7.com/community/metasploit/blog/2013/01/09/serialization-mischief-in-ruby-land-cve-2013-0156
[lian]: https://github.com/lian

[GPLv3]: http://gplv3.fsf.org/

[ronin-support]: https://rubygems.org/gems/ronin-support
[String.generate]: /docs/ronin-support/String.html#generate-class_method

[rails_dos.rb]: https://gist.github.com/4499017
[rails_jsonq.rb]: https://gist.github.com/4499030
[rails_sqli.rb]: https://gist.github.com/4499032
[rails_rce.rb]: https://gist.github.com/4499206

[working PoC exploits]: www.reddit.com/r/netsec/comments/167c11/serious_vulnerability_in_ruby_on_rails_allowing/c7teov4
[weaponized exploit]: https://github.com/rapid7/metasploit-framework/pull/1282
