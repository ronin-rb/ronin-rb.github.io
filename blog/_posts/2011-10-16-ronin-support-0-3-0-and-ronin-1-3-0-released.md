---
layout: post
title: ronin-support 0.3.0 and ronin 1.3.0 released
author: postmodern
---

After roughly three months, new versions of [ronin-support][1] and [ronin][2]
have been released!

## Upgrade

    $ gem update ronin

## Easier Text Processing

[File.each_line][3] and [File.each_row][4] were added to help with processing
large text-files:

{% highlight ruby %}
File.each_line("wordlist.txt") do |word| 
  puts word
end

File.each_row("users_dump.txt", ',') do |user,pass|
  # ...
end
{% endhighlight %}

## Builtin Regexps

Some common and useful [Regular Expressions][5] were added to ronin-support:

* `Regexp::MAC`
* `Regexp::IPv4`, `Regexp::IPv6`, `Regexp::IP`
* `Regexp::HOST_NAME`
* `Regexp::USER_NAME`
* `Regexp::EMAIL_ADDR`

## Bruteforcing and Fuzzing

[String.generate][6] was added to assist in enumerating over every possible
String, based on a format template. This method is especially useful for
bruteforcing passwords or directories. The following code enumerates through
every password starting with five alpha characters and ending in one to three
numeric characters:

{% highlight ruby %}
String.generate([:alpha, 5], [:numeric, 1..3]) do |password|
  puts password
end
{% endhighlight %}

[String#fuzz][7] was added to assist in fuzzing Strings. This method will find
all occurrences of a sub-string or regular expression, and replace each one
with one or more substitutions. The following code replaces every occurrence of
a number with 1 to 100 `9` characters:

{% highlight ruby %}
"[1,2,3]".fuzz(/\d+/ => String.generate(['9', 1..100])) do |str|
  puts str
end
{% endhighlight %}

## Easier DNS Queries

Sometimes you need to query a specific DNS server, and bypass `/etc/hosts`.
Now you can, using any of the `lookup` methods:

{% highlight ruby %}
ip = IPAddr.new("209.20.85.251")
ip.lookup("4.2.2.1")
# => [#<Resolv::DNS::Name: 209-20-85-251.slicehost.net.>]
{% endhighlight %}

## URI::HTTP Convenience Methods

`Net.http_*` convenience methods were added to [URI::HTTP][8], for quicker
access:

{% highlight ruby %}
url = URI("http://www.vannin.com/robots.txt")

url.ok?
# => true

url.server
# => "Apache"

url.get
# => #<Net::HTTPOK 200 OK readbody=true>

url.get(:headers => {:referer => "><script>alert('XSS');</script>"})
# => #<Net::HTTPOK 200 OK readbody=true>
{% endhighlight %}

## Ronin::UI Moves

[Ronin::UI::Output][9] was moved out of ronin and down into ronin-support.
Now developers can use `print_info`, `print_warning` `print_error` methods
from [ronin-support][1]:

{% highlight ruby %}
require 'ronin/ui/output'
include Ronin::UI::Output::Helpers
    
print_info  "Hello"
print_error "Danger!"
{% endhighlight %}

[Ronin::UI::Shell][10] was also moved into ronin-support and refactored.
Ronin::UI::Shell is now a Class, where commands can be defined as protected
methods:

{% highlight ruby %}
require 'ronin/ui/shell'

class PwnShell < Ronin::UI::Shell

  protected

  def scan(target)
    IPAddr.each(target) do |ip|
      begin
        print_info "%s:\t%s", ip, Net.http_server(:host => ip)
      rescue
      end
    end
  end

  def dirbust(target,*words)
    Net.http_session(:host => target) do |http|
      words.each do |word|
        path = "/#{word}"

        if http.get(path).code == "200"
          print_info "Found http://#{target}#{path} ..."
        end
      end
    end
  end

end

PwnShell.start
{% endhighlight %}

    > help
    Available commands:

      dirbust target [words]
      exit 
      help 
      quit 
      scan target

## Extract and Import Methods

`extract` and `import` methods were added to [MACAddress][11], [IPAddress][12],
[HostName][13], [URL][14] and [EmailAddress][15]. `extract` can parse large
amounts of text and extract Resources from it:

{% highlight ruby %}
HostName.extract(text) { |host| puts host }
{% endhighlight %}

`import` reads every line of a file and saves extracted Resources into the
Database:

{% highlight ruby %}
IPAddress.import("ips.txt") { |ip| puts ip }
{% endhighlight %}

## Inline Commands and Tab-Completion

The Ronin Console received some significant improvements in 1.3.0.

Inline Commands were added to the Ronin Console, allowing you to quickly execute
system commands. Simply prefix the command to run with a `!`:

    >> "olleh".reverse
    # => "hello"
    >> !ncat github.com 80
    GET /
    <html>
    <head><title>301 Moved Permanently</title></head>
    <body bgcolor="white">
    <center><h1>301 Moved Permanently</h1></center>
    <hr><center>nginx/1.0.4</center>
    </body>
    </html>
    
New Tab Completion rules were also added, allowing you to tab-complete data
in the Database and more:

* [Ronin::IPAddress][12]es:

      >> "192.168.<TAB><TAB>
      192.168.1.1
      192.168.1.52

* [Ronin::HostName][13]s:

      >> "www.ex<TAB><TAB>
      www.example.com
      www.exploit-db.com

* [Ronin::URL][14]s:

      >> "http://www.victim.com/<TAB><TAB>
      http://www.victim.com/index.php
      http://www.victim.com/page.php?id=1
      http://www.victim.com/page.php?id=2
      http://www.victim.com/page.php?id=3

* [Ronin::EmailAddress][15]es:

      >> "alice@e<TAB><TAB>
      alice@evil.com
      alice@example.com

* Local files / directories:

      >> File.read("dump.<TAB><TAB>
      dump.txt
      dump.csv

* Inline Commands:

      >> !nc<TAB><TAB>
      !nc
      !ncat
      !ncftp

[1]: http://rubygems.org/gems/ronin-support
[2]: http://rubygems.org/gems/ronin
[3]: http://rubydoc.info/gems/ronin-support/0.3.0/File#each_line-class_method
[4]: http://rubydoc.info/gems/ronin-support/0.3.0/File#each_row-class_method
[5]: https://github.com/ronin-ruby/ronin-support/blob/v0.3.0/lib/ronin/extensions/regexp.rb#L22-45
[6]: http://rubydoc.info/gems/ronin-support/0.3.0/String#generate-class_method
[7]: http://rubydoc.info/gems/ronin-support/0.3.0/String#fuzz-instance_method
[8]: http://rubydoc.info/gems/ronin-support/0.3.0/URI/HTTP
[9]: http://rubydoc.info/gems/ronin-support/0.3.0/Ronin/UI/Output
[10]: http://rubydoc.info/gems/ronin-support/0.3.0/Ronin/UI/Shell
[11]: http://rubydoc.info/gems/ronin/1.3.0/Ronin/MACAddress
[12]: http://rubydoc.info/gems/ronin/1.3.0/Ronin/IPAddress
[13]: http://rubydoc.info/gems/ronin/1.3.0/Ronin/HostName
[14]: http://rubydoc.info/gems/ronin/1.3.0/Ronin/URL
[15]: http://rubydoc.info/gems/ronin/1.3.0/Ronin/EmailAddress
