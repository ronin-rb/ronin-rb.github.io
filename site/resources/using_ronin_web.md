---
layout: default
title: Using Ronin Web
---

# Using Ronin Web

The [Ronin Web](http://ronin.rubyforge.org/docs/ronin-web/) library provides
support for Web Scraping and Spidering functionality in Ronin.

Before we can use this library in the Ronin Console, we must first install
the library. To install the Ronin Web library used in this guide, simply
run the following command:

    $ sudo gem install ronin-web

To start the Ronin Console, with ronin-web pre-loaded, simply run the
`ronin-web` command:

    $ ronin-web

## Proxy Settings

Accessing the Ronin Web Proxy settings, just like in
[Network::HTTP](http://ronin.rubyforge.org/docs/ronin/Ronin/Network/HTTP.html):

    Web.proxy
    # => {:port=>8080, :pass=>nil, :user=>nil, :host=>nil}

## User Agent Settings

Accessing the Ronin Web User-Agent string:

    Web.user_agent
    # => nil

    Web.user_agent = 'PowerThurst Bot v4.7'
    # => "PowerThurst Bot v4.7"

User-Agent aliases:

    Web.user_agent_aliases
    # => {"Mac Mozilla"=>"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.4a) Gecko/20030401",
    "Mechanize"=>"WWW-Mechanize/0.7.6 (http://rubyforge.org/projects/mechanize/)",
    "Linux Mozilla"=>"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624",
    "Windows IE 6"=>"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)",
    "iPhone"=>"Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3",
    "Windows IE 7"=>"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
    "Linux Konqueror"=>"Mozilla/5.0 (compatible; Konqueror/3; Linux)",
    "Mac FireFox"=>"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.3) Gecko/20060426 Firefox/1.5.0.3",
    "Windows Mozilla"=>"Mozilla/5.0 (Windows;U; Windows NT 5.0; en-US; rv:1.4b) Gecko/20030516 Mozilla Firebird/0.6",
    "Mac Safari"=>"Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3"}

Setting the Ronin User-Agent alias:

    Web.user_agent_alias = 'iPhone'
    # => "iPhone"

## WWW::Mechanize

Getting a persistent [WWW::Mechanize](http://mechanize.rubyforge.org/mechanize/WWW/Mechanize.html)
agent:

    agent = Web.agent(:user_agent_alias => 'iPhone')
    # => #<WWW::Mechanize:...>

    agent.get('http://news.ycombinator.net/')
    # => #<WWW::Mechanize::Page:...>

Getting a [WWW::Mechanize::Page](http://mechanize.rubyforge.org/mechanize/WWW/Mechanize/Page.html):

    Web.get('http://www.rubyinside.com/')
    # => #<WWW::Mechanize::Page:...>

Return the body of a `WWW::Mechanize::Page`:

    Web.get_body('http://www.rubyinside.com/')
    # => "..."

Posting with a `WWW::Mechanize::Page`:

    Web.post('http://www.example.com/login.php', :query => {:user => 'meowmix', :password => 'delivers'})
    # => #<WWW::Mechanize::Page:...>

Return the body of a posted `WWW::Mechanize::Page`:

    Web.post_body('http://www.example.com/login.php', :query => {:user => 'meowmix', :password => 'delivers'})
    # => "..."

Opening a web-page as a temporary file:

    Web.open('http://www.example.com/users.php')
    # => #<File:/tmp/open-uri.6645.0>

