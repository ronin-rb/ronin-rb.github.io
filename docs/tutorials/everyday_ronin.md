---
layout: default
title: Everyday Ronin
---

# Everyday Ronin

In day-to-day usage, the Ronin Ruby Console is the most commonly used
component of Ronin. This Console is not to be confused with a
typical interactive shell with simple one-word commands that most projects
implement. Instead, the Console is a customized
[Interactive Ruby Shell (IRB)](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell)
with tab-completion and auto-indentation enabled.

The Console provides one with the full power of the Ruby language and the
convenience methods of Ronin, all in a handy console. From this Console one
can perform research, scan for vulnerabilities and even exploit vulnerable
targets.

To install Ronin and the supporting libraries used in this guide, simply
run the following command:

```shell
$ sudo gem install ronin
```

To start a Ruby Console with [ronin] preloaded, simply run the `ronin irb`
command:

```shell
$ ronin irb
```

<div class="note">
  <p>
  <b>Note:</b> If you are new to the Ruby programming language, you might
  consider reviewing the <a href="http://www.rubycentral.com/book/">Pragmatic Programmers Guide to Ruby</a>,
  since it is expected that users of the Ronin Ruby Console have a basic
  understanding of Ruby programming practices.
  </p>

  <p>
  If you have questions regarding the methods or Classes defined within
  Ronin, you can consult the <a href="/docs/ronin-support/">API Documentation</a>
  for Ronin. If on the other hand, you have questions about methods or
  Classes provided by Ruby itself, I recommend using
  <a href="https://rubydoc.info/stdlib/core">rubydoc.info</a>.
  </p>
</div>

## Formatting Binary Data

Packing an [Integer](http://www.ruby-doc.org/core/classes/Integer.html):

```ruby
0x1337.pack(:uint32_le)
# => "7\x13\0\0"
```

**Note:** In Ruby everything is an [Object](http://www.ruby-doc.org/core/classes/Object.html)
even [Integers](http://www.ruby-doc.org/core/classes/Integer.html) and
[Strings](http://www.ruby-doc.org/core/classes/String.html)
are represented as Objects. These Objects have methods and are defined by
Classes, much like any other Object in Ruby. In the example above Ronin has
added the [pack](/docs/ronin/Integer.html#pack-instance_method)
method to the `Integer` class.

Packing an `Integer` with a custom address length:

```ruby
0x1337.pack(:uint16_le)
# => "7\x13"
```

Unpacking a previously packed `Integer`:

```ruby
"7\x13\0\0".unpack(:uint32_le)
# => [4919]
```

## Generating Text

Please see the [Chars](https://rubydoc.info/gems/chars) library for text
generation examples.

## Base64

Base64 encode a [String](http://www.ruby-doc.org/core/classes/String.html):

```ruby
payload = "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00 \
\x00\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80 \
\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff\xffxff\x2f \
\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3"
payload.base64_encode
# => "6ypeiXYIxkYHAMdGDAAAAAoAuAsAAACJ841OCI1WDM2AuAEAAAC7AAAAAM2A\n6NH///8vYmluL3NoAInsXcM=\n"
```

Base64 decode a `String`:

```ruby
"c2VjcmV0\n".base64_decode
# => "secret"
```

## Digests

Return the MD5 checksum of a [String](https://rubydoc.info/stdlib/core/String):

```ruby
"leet school".md5
# => "1b11ba66f5e9d40a7eef699cd812e362"
```

Return the SHA1 checksum of a `String`:

```ruby
"lol train".sha1
# => "37f05f0cc2914615c580af396df5c66316112f48"
```

Return the SHA256 checksum of a `String`:

```ruby
"admin".sha256
# => "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918"
```

Return the SHA512 checksum of a `String`:

```ruby
"thunder growl".sha512
# => "b2a1e560a497514dafda024f9e6fc2dfbfb178483251a708f07a88d4e157e5561604460da313ebc88dde2814ae58a15ae4085d00efb6a825a62f5be3215f5cbf"
```

## Paths

Escaping a directory:

```ruby
Path.up(7)
# => #<Ronin::Path:../../../../../../..>
```

Directory traversal:

```ruby
Path.up(7) / 'etc' / 'passwd'
# => #<Ronin::Path:../../../../../../../etc/passwd>
```

## Networking

Creating a TCP Socket for a specified host and port:

```ruby
sock = tcp_connect('www.example.com', 25)
# => #<TCPSocket:0xb7bbde6c>
```

Creating a TCP Socket with local host and port information:

```ruby
tcp_connect('www.example.com', 25, 'some.interface.net', 1212)
# => #<TCPSocket:0xb7ba0dd0>
```

Create a TCP Socket, then send some data:

```ruby
tcp_connect_and_send("helo lol.train.com\n", 'www.example.com', 25)
# => #<TCPSocket:0xb7b8fa6c>
```

Creating a TCP session which will be automatically closed:

```ruby
tcp_connect('www.example.com', 1212) do |sock|
  sock.write("this is just a test\n")
  puts sock.readline
end
```

Grabbing the banner from a TCP service:

```ruby
tcp_banner('www.example.com', 22)
# => "SSH-2.0-OpenSSH_4.3p2 Debian-8ubuntu1.4\n"
```

Creating a UDP Socket for a specified host and port:

```ruby
sock = udp_connect('www.example.com', 135)
# => #<UDPSocket:0xb7bbde6c>
```

Creating a UDP Socket with local host and port information:

```ruby
udp_connect('www.example.com', 135, 'some.interface.net', 3030)
# => #<UDPSocket:0xb7ba0dd0>
```

Create a UDP Socket, then send some data:

```ruby
udp_connect_and_send("mic check\n", 'www.example.com', 1212)
# => #<UDPSocket:0xb7b8fa6c>
```

Creating a UDP session which will be automatically closed:

```ruby
udp_connect('www.example.com', 3030) do |sock|
  sock.write("I want to devise a virus.\n")
  puts sock.readline
end
```

**Note:** For more Networking convenience methods, consult the documentation
for the [Net](/docs/ronin/Net.html) namespace.

## URLs

Accessing the URL query parameters:

```ruby
url = URI('http://www.google.com/search?hl=en&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=1HY&q=bob+ross&btnG=Search')
url.query_params
# => {"btnG"=>"Search", "hs"=>"1HY", "rls"=>"org.mozilla:en-US:official", "client"=>"firefox-a", "hl"=>"en", "q"=>"bob+ross"}

url.query_params['q']
# => "bob+ross"
```

Setting the URL query parameters:

```ruby
url.query_params['q'] = 'Upright Citizens Brigade'
url.to_s
# => "http://www.google.com/search?btnG=Search&hs=1HY&rls=org.mozilla:en-US:official&client=firefox-a&hl=en&q=Upright%20Citizens%20Brigade"
```

Setting the URL query parameters en-mass:

```ruby
url.query_params = {'q' => 'meowmix', 'start' => 20, 'sa' => 'N'}
url.to_s
# => "http://www.google.com/search?sa=N&start=20&q=meowmix"
```

## HTTP

HTTP Proxy settings:

```ruby
Metwork::HTTP.proxy
# => nil
```

Setting the HTTP Proxy settings:

```ruby
Network::HTTP.proxy = 'http://200.207.114.146:8080'
```

Disabling HTTP Proxy settings

```ruby
Network::HTTP.proxy = nil
```

Requesting a web-page:

```ruby
http_get('http://www.wired.com/')
# => #<Net::HTTPOK 200 OK readbody=true>
```

Requesting only the body of a web-page:

```ruby
http_get_body('http://www.wired.com/')
# => "..."
```

Posting to a web-page:

```ruby
http_post(some_url, :post_data => {:q => 1, :id => 255})
# => #<Net::HTTPOK 200 OK readbody=true>
```

Posting to a web-page and only returning the body of the response:

```ruby
http_post_body(some_url)
# => "..."
```

[ronin]: https://github.com/ronin-rb/ronin#readme
