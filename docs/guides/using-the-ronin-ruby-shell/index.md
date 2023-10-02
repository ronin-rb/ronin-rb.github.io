---
layout: page
title: Docs - Using the Ronin Ruby Shell
---

# Using the Ronin Ruby Shell

Ronin is more than just a bunch of commands and sub-commands. Each sub-command
is built on top of Ronin's many Ruby libraries and APIs. You can interact with
these same Ruby libraries and APIs directly in Ronin's interactive Ruby Shell,
which is similar to Ruby's `irb` command but with the Ronin libraries preloaded.
To start Ronin's interactive Ruby Shell, run `ronin irb`:

```
$ ronin irb
irb(ronin)>
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
To exit the `ronin irb` shell, press `Ctrl` and `D` keys, or type `exit`.
  </div>
</article>

Ruby code can be entered directly into the shell and executed:

```
$ ronin irb
irb(ronin)> 1 + 1
=> 2
irb(ronin)> puts "Hello World"
Hello World
=> nil
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
The value after the `=>` is the return value of the previous Ruby statement.
  </div>
</article>

If you are interested in learning more about Ruby syntax, see the
[Ruby Quick Ref].

[Ruby Quick Ref]: ../ruby-quick-ref/

## Core Extensions

Core Extensions are simply methods that have been added to Ruby's Core classes,
such as `Integer`, `String`, or `Array`. Ronin adds many useful Core Extensions
for String encoding/decoding, packing/unpacking binary data, Cryptography, 
compressing/decompressing data, String mutating, and working with URLs,
to help make Ruby even *more* powerful!

These Core Extension methods can be called *directly* on a value or an object.

```
irb(ronin)> "test".md5
=> "098f6bcd4621d373cade4e832627b4f6"
irb(ronin)> "foo bar baz".base64_encode
=> "Zm9vIGJhciBiYXo=\n"
irb(ronin)> "hello world".zlib_deflate
=> "x\x9C\xCBH\xCD\xC9\xC9W(\xCF/\xCAI\x01\x00\x1A\v\x04]"
irb(ronin)> 0x1337.pack(:uint32_le)
=> "7\x13\x00\x00"
irb(ronin)> [0x1234, "hello"].pack(:uint16_le, :string)
=> "4\x12hello\x00"
irb(ronin)> File.hexdump('/bin/ls')
00000000  7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00  |.ELF............|
00000010  03 00 3e 00 01 00 00 00 30 6d 00 00 00 00 00 00  |..>.....0m......|
00000020  40 00 00 00 00 00 00 00 58 22 02 00 00 00 00 00  |@.......X"......|
00000030  00 00 00 00 40 00 38 00 0d 00 40 00 20 00 1f 00  |....@.8...@. ...|
00000040  06 00 00 00 04 00 00 00 40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  |@.......@.......|
...
=> nil
irb(ronin)> URI('http://github.com/').status
=> 301
irb(ronin)> URI('https://example.com/?a=1&b=2&c=foo%20bar').query_params
=> {"a"=>"1", "b"=>"2", "c"=>"foo bar"}
```

To view the methods available on an object, simply type the value followed by a
`.` and hit the `TAB` key:

```
$ ronin irb
irb(ronin)> 42.<TAB>
irb(ronin)> "foo".<TAB>
```

To view the documentation for these Core Extension methods, see the
documentation for [Integer], [Float], [String], [Array], [IO], [File], [IPAddr],
and [URI::HTTP].

[Integer]: /docs/ronin-support/Integer.html
[Float]: /docs/ronin-support/Float.html
[String]: /docs/ronin-support/String.html
[Array]: /docs/ronin-support/Array.html
[IO]: /docs/ronin-support/IO.html
[File]: /docs/ronin-support/File.html
[IPAddr]: /docs/ronin-support/IPAddr.html
[URI::HTTP]: /docs/ronin-support/URI/HTTP.html

## Mixin Methods

In addition to Core Extensions, Ronin also adds many other Mixin methods to the
Ruby Shell.

```
irb(ronin)> random_alpha_numeric(10)
=> "z5BPgMr7hJ"
irb(ronin)> http_get_headers 'https://example.com/'
=> 
{"Accept-Ranges"=>"bytes",                         
 "Age"=>"532169",                                  
 "Cache-Control"=>"max-age=604800",                
 "Content-Type"=>"text/html; charset=UTF-8",       
 "Date"=>"Fri, 02 Jun 2023 07:23:25 GMT",          
 "Etag"=>"\"3147526947\"",                         
 "Expires"=>"Fri, 09 Jun 2023 07:23:25 GMT",       
 "Last-Modified"=>"Thu, 17 Oct 2019 07:18:26 GMT", 
 "Server"=>"ECS (sec/976A)",                       
 "Vary"=>"Accept-Encoding",                        
 "X-Cache"=>"HIT",                 
 "Content-Length"=>"1256",         
 "Connection"=>"close"}
```

To view a full list of the available Mixin methods, see the documentation for
[Ronin::Support::Mixin].

[Ronin::Support::Mixin]: /docs/ronin-support/Ronin/Support/Mixin.html 

<div class="level">
  <div class="level-left">
    <a class="button" href="../using-the-ronin-cli/">
      &laquo; Using the Ronin CLI
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="/docs/#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="../using-ronin-repos/">
      Using Ronin Repos &raquo;
    </a>
  </div>
</div>
