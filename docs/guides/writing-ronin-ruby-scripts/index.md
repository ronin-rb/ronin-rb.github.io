---
layout: page
title: Writing Ronin Ruby Scripts
---

# Writing Ronin Ruby Scripts

Ronin isn't just a CLI with a bunch of commands. The Ronin CLI is actually
built on top of many powerful Ruby libraries and APIs, which you can use
directly in custom Ruby scripts. Anything that the Ronin CLI can do, you can do
in a Ruby script, usually in less than five lines!

Ronin provides the [ronin-support] library to help with writing custom Ruby
scripts. [ronin-support] adds many APIs and extends Ruby to make it even more
powerful!

## Install

If you do not already have [ronin-support] installed, it can easily be installed
via rubygems:

```shell
$ gem install ronin-support
```

## Loading

To load *all* of [ronin-support] into the current context, first require it then
include the `Ronin::Support` module.

```ruby
require 'ronin/support'
include Ronin::Support
```

This will both load *all* of [ronin-support][ronin-support-docs] and give you
access to everything defined within the [Ronin::Support] namespace.

[Ronin::Support]: /docs/ronin-support/Ronin/Support.html

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
While requiring *all* of `ronin/support` allows you to play around with
[ronin-support][ronin-support-docs] in `irb`, it is always faster to selectively
require only the files you need from `ronin/support`.

[ronin-support-docs]: /docs/ronin-support/
  </div>
</article>

## API

[ronin-support][ronin-support-docs] provides many different APIs for
encoding/decoding data, working with binary data, generating/manipulating text,
compressing/decompressing data, reading/writing archives, cryptography,
and networking.

* [Encoding / Decoding](encoding.html)
  * [Base64](encoding.html#base64)
  * [Base32](encoding.html#base32)
  * [Base16](encoding.html#base16)
  * [C](encoding.html#c)
  * [Hex](encoding.html#hex)
  * [HTML](encoding.html#html)
  * [HTTP](encoding.html#http)
  * [JavaScript](encoding.html#javascript)
  * [PowerShell](encoding.html#powershell)
  * [Punycode](encoding.html#punycode)
  * [Quoted Printable](encoding.html#quoted-printable)
  * [Ruby](encoding.html#ruby)
  * [Shell](encoding.html#shell)
  * [SQL](encoding.html#sql)
  * [URI](encoding.html#uri)
  * [UUencoding](encoding.html#uuencoding)
  * [XML](encoding.html#xml)
* [Binary Data](binary.html)
  * [Packing / Unpacking](binary.html#packing-unpacking)
  * [Buffer](binary.html#buffer)
  * [Stream](binary.html#stream)
  * [CString](binary.html#cstring)
  * [Array](binary.html#array)
  * [Struct](binary.html#struct)
  * [Union](binary.html#union)
  * [Packet](binary.html#packet)
  * [Stack](binary.html#stack)
* [Text](text.html)
  * [Random](text.html#random)
  * [ERB](text.html#erb)
  * [Typos](text.html#typos)
  * [Homoglyphs](text.html#homoglyphs)
* [Compression](compression.html)
  * [Zlib](compression.html#zlib)
  * [Gzip](compression.html#gzip)
  * [Mixin module](compression.html#mixin-module)
* [Archives](archives.html)
  * [Tar](archives.html#tar)
  * [Zip](archives.html#zip)
  * [Mixin module](archives.html#mixin-module)
* [Cryptography](cryptography.html)
  * [Hashes](cryptography.html#hashes)
  * [HMAC](cryptography.html#hmac)
  * [Encryption](cryptography.html#encryption)
    * [AES](cryptography.html#aes)
    * [RSA](cryptography.html#rsa)
    * [ROT](cryptography.html#rot)
    * [XOR](cryptography.html#xor)
  * [Mixin module](cryptography.html#mixin-module)
* [Networking](networking.html)
  * [IP addresses](networking.html#ip-addresses)
  * [IP ranges](networking.html#ip-ranges)
  * [Host names](networking.html#host-names)
  * [Domains](networking.html#domains)
  * [TCP](networking.html#tcp)
  * [UDP](networking.html#udp)
  * [UNIX sockets](networking.html#unix-sockets)
  * [SSL](networking.html#ssl)
  * [TLS](networking.html#tls)
  * [HTTP](networking.html#http)

<div class="level">
  <div class="level-left">
    <a class="button" href="../ruby-quick-ref/">
      &laquo; Ruby Qucik Ref
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="../index.html#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="encoding.html">
      Writing Ronin Ruby Scripts - Encoding &raquo;
    </a>
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/
