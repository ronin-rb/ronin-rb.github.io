---
layout: post
title: ronin-scanners 1.0.0.pre1 released!
author: postmodern
---

After much stressing over API design and refactoring [ronin-scanners] 1.0.0.pre1
has been released. [1.0.0.pre1] is a complete rewrite of ronin-scanners
when compared to [0.1.4]; released back in 2009. The new API for
[ronin-scanners] now allows for developers to write Scanners in Ruby and have
their results automatically imported into the Ronin Database! This new API
opens the door for quickly pulling data off the internet and into Ronin.

## Install

[ronin-scanners] 1.0.0.pre1 can be installed from [rubygems.org][1.0.0.pre1]
like so:

    $ gem install ronin-scanners --pre

## API

All Ronin Scanners inherit from the [Ronin::Scanners::Scanner] base class.

For a Scanner to be a functioning scanner, it must define a `scan` method.
The `scan` method performs the actual "scanning" and yields each result.
A result from a Scanner can be any kind of Object;
whatever makes the most sense for a particular Scanner.

{% highlight ruby %}
def scan
  sitemap = Nokogiri::XML(http_get_body(:path => SITEMAP_PATH))

  sitemap.search('/urlset/url/loc/.').each do |url|
    yield url
  end
end
{% endhighlight %}

### Parameters

Since the `scan` method takes no arguments, Scanners are configured by the
parameters they define.

{% highlight ruby %}
# The URL to start spidering at.
parameter :start_at, :description => 'The URI to start scanning at'

# The hosts to spider.
parameter :hosts, :default => Set[],
                  :description => 'The hosts to scan'
{% endhighlight %}

### Results

Many Scanners will likely invoke third-party scanners, and the returned
results may not always be so consistent. For this, one can define a
`normalize_result` method:

{% highlight ruby %}
def normalize_result(result)
  unless result.kind_of?(::URI::Generic)
    begin
      URI.parse(result.to_s)
    rescue URI::InvalidURIError, URI::InvalidComponentError
    end
  else
    result
  end
end
{% endhighlight %}

If `normalize_result` returns `nil`, the result is considered invalid and
ignored.

### Resources

In order for a Scanner to import results into the Database, it must define
a `new_resource` method. The `new_resource` method takes a Scanner result and
converts it into a Database Resource, which can later be saved into
the Database.

{% highlight ruby %}
def new_resource(result)
  IPAddress.first_or_new(:address => result)
end
{% endhighlight %}

Depending on which Scanner base-class one inherits from
(ex: [URLScanner][Ronin::Scanners::URLScanner]), a `new_resource` method
may already be defined.

### Methods

The [Scanner][Ronin::Scanners::Scanner] base class defines three methods
for enumerating over Scanner results:

1. [each] - The primary enumerator method, which simply calls `scan` and yields
   the Scanner results.
2. [each_resource] - Simply calls [each] and converts each Scanner result
   into a Database Resource object via the `new_resource` method.
3. [import] - Simply calls [each_resource], saves each new Database
   Resource returned by `new_resource` and yields the successfully saved
   Resources.

For convenience sake, [Scanner][Ronin::Scanners::URLScanner] also define
class-methods for [each][Ronin::Scanners::Scanner.each],
[scan][Ronin::Scanners::Scanner.scan] and
[import][Ronin::Scanners::Scanner.import].

{% highlight ruby %}
Ronin::Scanners::Spider.import(:hosts => ['www.example.com']) do |url|
  puts "Scanned #{url}"
end
{% endhighlight %}

## Classes

[ronin-scanners] provides various Scanner base-classes:

* [Ronin::Scanners::IPScanner]
* [Ronin::Scanners::HostNameScanner]
* [Ronin::Scanners::TCPPortScanner]
* [Ronin::Scanners::UDPPortScanner]
* [Ronin::Scanners::URLScanner]

[ronin-scanners] also provides several built-in Scanners:

* [Ronin::Scanners::Dork]
* [Ronin::Scanners::ResolvScanner]
* [Ronin::Scanners::ReverseLookupScanner]
* [Ronin::Scanners::SiteMap]
* [Ronin::Scanners::Spider]
* [Ronin::Scanners::Nmap]
* [Ronin::Scanners::Proxies]

## Commands

[ronin-scanners] provides several commands for the built-in Scanners:

* `$ ronin scanners` - Starts the Ronin Console with ronin-scanners loaded.
* `$ ronin scanner` - Loads a Scanner from a file or from the Database
  and runs it.
* `$ ronin scan:dork` - Performs Google Dorks.
* `$ ronin scan:nmap` - Automates nmap scans and imports them into the Database.
* `$ ronin scan:proxies` - Scans for proxies and imports them into the Database.
* `$ ronin scan:spider` - Spiders a website and saves URLs into the Database.

## How to Help

Since this is a pre-release _and_ a complete rewrite of [ronin-scanners],
your help is greatly needed! Here's how you can help out:

1. Install it (`$ gem install ronin-scanners --pre`)
2. Test the commands
3. Review the [documentation]
4. Attempt to write a [script](https://gist.github.com/3803087)
   which uses one of the Scanners
5. Submit bugs or suggestions on [GitHub][issues]

Let's make [ronin-scanners] 1.0.0 a solid release!

[ronin-scanners]: https://github.com/ronin-ruby/ronin-scanners#readme
[0.1.4]: https://rubygems.org/gems/ronin-scanners/versions/0.1.4
[1.0.0.pre1]: https://rubygems.org/gems/ronin-scanners/versions/1.0.0.pre1
[documentation]: /docs/ronin-scanners/frames
[issues]: https://github.com/ronin-ruby/ronin-scanners/issues?direction=desc&sort=created&state=open

[each]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each-instance_method
[each_resource]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each_resource-instance_method
[import]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#import-instance_method
[Ronin::Scanners::Scanner.each]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each-class_method
[Ronin::Scanners::Scanner.scan]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#scan-class_method
[Ronin::Scanners::Scanner.import]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#import-class_method

[Ronin::Scanners::Scanner]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html
[Ronin::Scanners::IPScanner]: /docs/ronin-scanners/Ronin/Scanners/IPScanner.html
[Ronin::Scanners::HostNameScanner]: /docs/ronin-scanners/Ronin/Scanners/HostNameScanner.html
[Ronin::Scanners::TCPPortScanner]: /docs/ronin-scanners/Ronin/Scanners/TCPPortScanner.html
[Ronin::Scanners::UDPPortScanner]: /docs/ronin-scanners/Ronin/Scanners/UDPPortScanner.html
[Ronin::Scanners::URLScanner]: /docs/ronin-scanners/Ronin/Scanners/URLScanner.html

[Ronin::Scanners::Dork]: /docs/ronin-scanners/Ronin/Scanners/Dork.html
[Ronin::Scanners::ResolvScanner]: /docs/ronin-scanners/Ronin/Scanners/ResolvScanner.html
[Ronin::Scanners::ReverseLookupScanner]: /docs/ronin-scanners/Ronin/Scanners/ReverseLookupScanner.html
[Ronin::Scanners::SiteMap]: /docs/ronin-scanners/Ronin/Scanners/SiteMap.html
[Ronin::Scanners::Spider]: /docs/ronin-scanners/Ronin/Scanners/Spider.html
[Ronin::Scanners::Nmap]: /docs/ronin-scanners/Ronin/Scanners/Nmap.html
[Ronin::Scanners::Proxies]: /docs/ronin-scanners/Ronin/Scanners/Proxies.html
