---
layout: post
title: Parsing URIs is easy
author: postmodern
---

Despite what others may [say][1], parsing URIs is _not_ hard.

In fact, Ruby already makes parsing URIs fairly easy with the `URI()` method.

{% highlight ruby %}
uri = URI('http://www.google.com/search?q=parsing+URIs+is+hard%2C+let%27s+go+shopping&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:unofficial&client=firefox-a')
# => #<URI::HTTP:0x00000000f94188 URL:http://www.google.com/search?q=parsing+URIs+is+hard%2C+let%27s+go+shopping&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:unofficial&client=firefox-a>
{% endhighlight %}

## Query Params

Although, the [URI][2] library does not parse the parameters within the query
string. Ronin, like other modern Ruby projects, depends on many other smaller
[RubyGems][3] for functionality; also so you don't have to install and require
them by hand. One such RubyGem is [uri-query_params][4], which allows you to
access the parameters within the query string of _any_ [URI::HTTP][5]
(or [URI::HTTPS][6]) object:

{% highlight ruby %}
uri.query_params['q']
# => "parsing+URIs+is+hard,+let's+go+shopping"
pp uri.query_params
# {"q"=>"parsing+URIs+is+hard,+let's+go+shopping",
#  "ie"=>"utf-8",
#  "oe"=>"utf-8",
#  "aq"=>"t",
#  "rls"=>"org.mozilla:en-US:unofficial",
#  "client"=>"firefox-a"}
# => {"q"=>"parsing+URIs+is+hard,+let's+go+shopping", "ie"=>"utf-8", "oe"=>"utf-8", "aq"=>"t", "rls"=>"org.mozilla:en-US:unofficial", "client"=>"firefox-a"}
{% endhighlight %}

Additionally, you can [parse][7]/[dump][8] individual query strings:

{% highlight ruby %}
URI::QueryParams.parse("q=1&x=2")
# => {"q" => "1", "x" => "2"}
URI::QueryParams.dump(:q => 1, :x => 2)
# => "q=1&x=2"
{% endhighlight %}

<div class="note">
<p>
The <kbd>URI::QueryParams.dump</kbd> method is also used by
<a href="/docs/ronin-support/Ronin/Network/HTTP.html">HTTP</a>
helper methods for the <kbd>:query_params</kbd> option:
</p>

{% highlight ruby %}
http_get(:host => 'example.com', :path => '/page.php', :query_params => {'id' => "1 OR 1=1"})
{% endhighlight %}
</div>

## Non-standard URIs

There are URIs that Ruby has trouble parsing, such as so called
[punycode][9] domains. Not to worry, Ronin also requires the
[addressable][10] RubyGem, a URI parsing library on steroids:

{% highlight ruby %}
uri = Addressable::URI.parse("http://www.詹姆斯.com/?q=1")
# => #<Addressable::URI:0xb525d4 URI:http://www.詹姆斯.com/?q=1>
uri.normalize
# => #<Addressable::URI:0xb57bec URI:http://www.xn--8ws00zhy3a.com/?q=1>
{% endhighlight %}

With Ronin, parsing URIs is easy.

[1]: https://community.rapid7.com/community/metasploit/blog/2012/03/12/uri-parsing-its-harder-than-you-think
[2]: http://rubydoc.info/stdlib/uri
[3]: http://rubygems.org/
[4]: https://github.com/postmodern/uri-query_params#readme
[5]: http://rubydoc.info/stdlib/uri/1.9.2/URI/HTTP
[6]: http://rubydoc.info/stdlib/uri/1.9.2/URI/HTTPS
[7]: http://rubydoc.info/gems/uri-query_params/URI/QueryParams#parse-class_method
[8]: http://rubydoc.info/gems/uri-query_params/URI/QueryParams#dump-class_method
[9]: http://en.wikipedia.org/wiki/Punycode
[10]: https://github.com/sporkmonger/addressable#readme
