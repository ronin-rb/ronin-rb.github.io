---
layout: default
title: About
feed: /blog/atom.xml
css:
 - examples.css
js:
 - jquery.min.js
 - examples.js
---

# Ronin

Ronin is a [Ruby] platform for vulnerability research and [exploit development].
Ronin allows for the rapid development and distribution of code,
[Exploits][example-exploit], [Payloads][example-payload],
[Scanners][example-scanner], etc, via [Repositories].

### Console

Ronin provides users with a powerful Ruby Console, pre-loaded with powerful
convenience methods. In the Console one can work with data and automate
complex tasks, with greater ease than the command-line.

    >> File.read('data').base64_decode

### Database

Ronin ships with a preconfigured Database, that one can interact with from Ruby,
without having to write any SQL.

    >> HostName.tld('eu').urls.with_query_param('id')

### Repositories

Ronin provides a Repository system, allowing users to organize and share
miscallaneous Data, Code, [Exploits][example-exploit],
[Payloads][example-payload], [Scanners][example-scanner], etc.

    $ ronin install git://github.com/user/myexploits.git

### Libraries

Ronin provides libraries with additional functionality, such as
[Exploitation][ronin-exploits] and [Scanning][ronin-scanners]:

    $ gem install ronin-exploits

## Install

Install Ronin using [RubyGems](http://rubygems.org/gems/ronin):

    $ gem install ronin

Install Ronin on [Debian](/docs/install/debian.html), 
[Ubuntu](/docs/install/ubuntu.html),
[Fedora](/docs/install/fedora.html) or
[Mac OS X](/docs/install/osx.html).

## Examples

A couple of [examples](/examples/) of things Ronin simplifies.

<ul id="examples">
  <!-- Random Examples -->
</ul>

[Ruby]: http://www.ruby-lang.org
[exploit development]: http://www.exploit-db.com
[example-exploit]: https://github.com/postmodern/postmodern/blob/master/scripts/exploits/http/oracle/dav_bypass.rb
[example-payload]: https://gist.github.com/1403961
[example-scanner]: https://github.com/postmodern/postmodern/blob/master/scripts/scanners/oracle_dad_scanner.rb
[Repositories]: https://github.com/postmodern/postmodern
[Bitcoins]: http://bitcoin.org/

[ronin-support]: https://github.com/ronin-ruby/ronin-support#readme
[ronin-exploits]: https://github.com/ronin-ruby/ronin-exploits#readme
[ronin-scanners]: https://github.com/ronin-ruby/ronin-scanners#readme
