---
layout: post
title: ronin-scanners 1.0.0.pre1 released!
author: postmodern
---

After much stressing over API design and refactoring [ronin-support] 1.0.0.pre1
has been pre-released. 1.0.0.pre1 is a complete rewrite of ronin-scanners
compared to [0.1.4]; released back in 2009. The new API of ronin-scanners now
allows for developers to write Scanners in Ruby and have their results
automatically imported into the Ronin Database! This new API opens the door
for quickly getting data from the internet into Ronin.

## Install

    $ gem install ronin-scanners --pre

## API

All Ronin Scanners now inherit from the [Ronin::Scanners::Scanner] base class.

For a Scanner class (or Object) to be a functioning scanner, it must define
a `scan` method. The `scan` method does the actual "scanning" and yields
each scan result. A result from a Ronin Scanner can be anything; whatever
makes the most sense for the particular Scanner.

{% highlight ruby %}
def scan
  sitemap = Nokogiri::XML(http_get_body(:path => SITEMAP_PATH))

  sitemap.search('/urlset/url/loc/.').each do |url|
    yield url
  end
end
{% endhighlight %}

Since the `scan` method takes no arguments, Scanners are configured by the
parameters they define.

{% highlight ruby %}
# The URL to start spidering at.
parameter :start_at, :description => 'The URI to start scanning at'

# The hosts to spider.
parameter :hosts, :default => Set[],
                  :description => 'The hosts to scan'
{% endhighlight %}

The other important method which a Ronin Scanner must define, is `new_resource`.
The `new_resource` method takes a Scanner result and converts it into a
Ronin Database Resource, which can later be saved into the Database.

{% highlight ruby %}
def new_resource(result)
  IPAddress.first_or_new(:address => result)
end
{% endhighlight %}

Depending on which Scanner base-class one inherits from
(ex: [URLScanner][Ronin::Scanners::URLScanner]), a `new_resource` method
may already be defined.

The [Scanner][Ronin::Scanners::Scanner] base class defines three methods
for enumerating over Scanner results.

1. [each] - The primary enumerator method, which simply calls `scan` and yields
   the Scanner results.
2. [each_resource] - Simply calls [each], except converts each Scanner result
   into a Ronin Database Resource object via the `new_resource` method.
3. [import] - Simply calls [each_resource] and saves every new Ronin Database
   Resource returned by `new_resource`, yielding the successfully saved
   Resources.

For convenience sake, all Scanner classes also define class-methods for
[each][Scanner.each], [scan][Scanner.scan] and [import][Scanner.import].

{% highlight ruby %}
Ronin::Scanners::Spider.import(:hosts => ['www.example.com']) do |url|
  puts "Scanned #{url}"
end
{% endhighlight %}

## Commands

* `ronin scanners` - Starts the Ronin Console with ronin-scanners loaded.
* `ronin scanner` - Loads a Scanner from a file or from the Database
  and runs it.
* `ronin scan:dork` - Performs Google Dorks.
* `ronin scan:nmap` - Automates nmap scans and imports them into the Database.
* `ronin scan:proxies` - Scans for proxies and imports them into the Database.
* `ronin scan:spider` - Spiders a website and saves URLs into the Database.

## How to Help

Since this is the first pre-release _and_ a complete rewrite of
[ronin-scanners], your help is needed! Here's how you can help out:

1. Install it (`gem install ronin-scanners --pre`)
2. Run the commands.
3. Proof-read the [documentation]
4. Attempt to write a [script](https://gist.github.com/3803087)
   using one of the Scanners.

Finally, you can submit any bugs or suggestions on [GitHub][issues].

[ronin-scanners]: https://github.com/ronin-ruby/ronin-scanners#readme
[0.1.4]: http://rubygems.org/gems/ronin-scanners/versions/0.1.4
[documentation]: /docs/ronin-scanners/frames
[issues]: https://github.com/ronin-ruby/ronin-scanners/issues?direction=desc&sort=created&state=open

[Ronin::Scanners::Scanner]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html
[Ronin::Scanners::URLScanner]: /docs/ronin-scanners/Ronin/Scanners/URLScanner.html
[each]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each-instance_method
[each_resource]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each_resource-instance_method
[import]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#import-instance_method
[Scanner.each]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#each-class_method
[Scanner.scan]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#scan-class_method
[Scanner.import]: /docs/ronin-scanners/Ronin/Scanners/Scanner.html#import-class_method
