---
layout: page
title: Writing Ronin Ruby Scripts - Encoding
---

# Writing Ronin Ruby Scripts - Encoding

## Table of Contents

* [Base64](#base64)
* [Base32](#base32)
* [Base16](#base16)
* [C](#c)
* [Hex](#hex)
* [HTML](#html)
* [HTTP](#http)
* [JavaScript](#javascript)
* [PowerShell](#powershell)
* [Punycode](#punycode)
* [Quoted Printable](#quoted-printable)
* [Ruby](#ruby)
* [Shell](#shell)
* [SQL](#sql)
* [URI](#uri)
* [UUencoding](#uuencoding)
* [XML](#xml)

## Base64

[ronin-support][ronin-support-docs] adds methods to Ruby's [String] class
for encoding/decoding Base64 data:

```ruby
require 'ronin/support/encoding/base64'

"foo bar\n".base64_encode
# => "Zm9vIGJhcgo=\n"

"czNjcjN0\n".base64_decode
# => "s3cr3t"
```

## Base32

[ronin-support][ronin-support-docs] adds Base32 encoding/decoding methods to
Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/base32'

"foo bar\n".base32_encode
# => "MZXW6IDCMFZAU==="

"OMZWG4RTOQ======".base32_decode
# => "s3cr3t"
```

## Base16

[ronin-support][ronin-support-docs] adds Base16 encoding/decoding methods to
Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/base16'

"foo bar\n".base16_encode
# => "666f6f206261720a"

"733363723374".base16_decode
# => "s3cr3t"
```

## C

[ronin-support][ronin-support-docs] adds C string encoding/decoding methods to
Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/c'

"hello\nworld\n".c_escape
# => "hello\\nworld\\n"

"hello".c_encode
# => "\\x68\\x65\\x6c\\x6c\\x6f"

"hello\nworld\n".c_string
# => "\"hello\\nworld\\n\""

"\\x68\\x65\\x6c\\x6c\\x6f\\x20\\x77\\x6f\\x72\\x6c\\x64".c_unescape
# => "hello world"

"\"hello\\nworld\"".c_unquote
# => "hello\nworld"
```

[ronin-support][ronin-support-docs] also adds [c_encode][Integer#c_encode] and
[c_escape][Integer#c_escape] methods to Ruby's built-in [Integer] class:

[Integer#c_encode]: /docs/ronin-support/Integer.html#c_encode-instance_method
[Integer#c_escape]: /docs/ronin-support/Integer.html#c_escape-instance_method

```ruby
0x41.c_encode
# => "\\x41"
0x100.c_encode
# => "\\u1000"
0x10000.c_encode
# => "\\U000100000"

0x41.c_escape
# => "A"
0x22.c_escape
# => "\\\""
0x7f.c_escape
# => "\\x7F"
```

## Hex

[ronin-support][ronin-support-docs] adds hex encoding/decoding methods to Ruby's
built-in [String] class:

```ruby
require 'ronin/support/encoding/hex'

"hello\nworld".hex_escape
# => "hello\\nworld"

"hello".hex_encode
# => "68656C6C6F"

"hello\nworld".hex_string
# => "\"hello\\nworld\""

"hello\\nworld".hex_unescape
# => "hello\nworld"

"68656C6C6F".hex_decode
# => "hello"

"\"hello\\nworld\"".hex_unquote
# => "hello\nworld"
```

[ronin-support][ronin-support-docs] also adds [hex_encode][Integer#hex_encode],
[hex_escape][Integer#hex_escape], and [hex_int][Integer#hex_int] methods to
Ruby's built-in [Integer] class:

[Integer#hex_encode]: /docs/ronin-support/Integer.html#hex_encode-instance_method
[Integer#hex_escape]: /docs/ronin-support/Integer.html#hex_escape-instance_method
[Integer#hex_int]: /docs/ronin-support/Integer.html#hex_int-instance_method

```ruby
0x41.hex_encode
# => "41"

42.hex_char
# => "\\x2a"

42.hex_int
# => "0x2e"
```

## HTML

[ronin-support][ronin-support-docs] adds HTML encoding/decoding methods to
Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/html'

"one & two".html_escape
# => "one &amp; two"

"abc".html_encode
# => "&#97;&#98;&#99;"

"&lt;p&gt;one &lt;span&gt;two&lt;/span&gt;&lt;/p&gt;".html_unescape
# => "<p>one <span>two</span></p>"
```

[ronin-support][ronin-support-docs] also adds
[html_encode][Integer#html_encode] and [html_escape][Integer#html_escape]
methods to Ruby's built-in [Integer] class:

[Integer#html_encode]: /docs/ronin-support/Integer.html#html_encode-instance_method
[Integer#html_escape]: /docs/ronin-support/Integer.html#html_escape-instance_method

```ruby
0x26.html_escape
# => "&amp;"

0x41.html_encode
# => "&#65;"
```

## HTTP
{: #encoding-http}

[ronin-support][ronin-support-docs] adds HTTP encoding/decoding methods to
Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/http'

"x > y".http_escape
# => "x+%3E+y"

"hello".http_encode
# => "%68%65%6c%6c%6f"

"sweet+%26+sour".http_unescape
# => "sweet & sour"
```

[ronin-support][ronin-support-docs] also adds
[http_encode][Integer#http_encode] and [http_escape][Integer#http_escape]
methods to Ruby's built-in [Integer] class:

[Integer#http_encode]: /docs/ronin-support/Integer.html#http_encode-instance_method
[Integer#http_escape]: /docs/ronin-support/Integer.html#http_escape-instance_method

```ruby
62.http_escape
# => "%3E"

0x41.http_encode
# => "%41"
```

## JavaScript

[ronin-support][ronin-support-docs] adds JavaScript string encoding/decoding
methods to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/js'

"hello\nworld\n".js_escape
# => "hello\\nworld\\n"

"hello".js_encode
# => "\\u0068\\u0065\\u006C\\u006C\\u006F"

"hello\nworld\n".js_string
# => "\"hello\\nworld\\n\""

"\\u0068\\u0065\\u006C\\u006C\\u006F world".js_unescape
# => "hello world"

"\"hello\\nworld\"".js_unquote
# => "hello\nworld"
```

[ronin-support][ronin-support-docs] also adds [js_encode][Integer#js_encode] and
[js_escape][Integer#js_escape] methods to Ruby's built-in [Integer] class:

[Integer#js_encode]: /docs/ronin-support/Integer.html#js_encode-instance_method
[Integer#js_escape]: /docs/ronin-support/Integer.html#js_escape-instance_method

```ruby
0x41.js_escape
# => "A"
0x22.js_escape
# => "\\\""
0x7f.js_escape
# => "\\x7F"

0x41.js_encode
# => "\\x41"
```

## PowerShell

[ronin-support][ronin-support-docs] adds PowerShell string encoding/decoding
methods to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/powershell'

"hello\nworld".powershell_escape
# => "hello`nworld"

"hello world".powershell_encode
# => "$([char]0x68)$([char]0x65)$([char]0x6c)$([char]0x6c)$([char]0x6f)$([char]0x20)$([char]0x77)$([char]0x6f)$([char]0x72)$([char]0x6c)$([char]0x64)"

"hello\nworld".powershell_string
# => "\"hello`nworld\""

"hello`nworld".powershell_unescape
# => "hello\nworld"

"\"hello`nworld\"".powershell_unquote
# => "hello\nworld"
"'hello''world'".powershell_unquote
# => "hello'world"
```

[ronin-support][ronin-support-docs] also adds [powershell_encode][Integer#powershell_encode] and
[powershell_escape][Integer#powershell_escape] methods to Ruby's built-in [Integer] class:

[Integer#powershell_encode]: /docs/ronin-support/Integer.html#powershell_encode-instance_method
[Integer#powershell_escape]: /docs/ronin-support/Integer.html#powershell_escape-instance_method

```ruby
0x41.powershell_escape
# => "A"
0x08.powershell_escape
# => "`b"
0xff.powershell_escape
# => "[char]0xff"

0x41.powershell_encode
# => "[char]0x41"
0x0a.powershell_encode
# => "`n"
```

## Punycode

[ronin-support][ronin-support-docs] adds [Punycode] string encoding/decoding
methods to Ruby's built-in [String] class:

[Punycode]: https://en.wikipedia.org/wiki/Punycode

```ruby
require 'ronin/support/encoding/punycode'

"詹姆斯".punycode_encode
# => "xn--8ws00zhy3a"

"xn--8ws00zhy3a".punycode_decode
# => "詹姆斯"
```

## Quoted Printable

[ronin-support][ronin-support-docs] adds [Quoted Printable] string
encoding/decoding methods to Ruby's built-in [String] class:

[Quoted Printable]: https://en.wikipedia.org/wiki/Quoted-printable

```ruby
require 'ronin/support/encoding/quoted_printable'

'<a href="https://example.com/">link</a>'.quoted_printable_escape
# => "<a href=3D\"https://example.com/\">link</a>=\n"

"詹姆斯".punycode_encode
# => "xn--8ws00zhy3a"

"<a href=3D\"https://example.com/\">link</a>=\n".quoted_printable_unescape
# => "<a href=\"https://example.com/\">link</a>"
```

## Ruby

[ronin-support][ronin-support-docs] adds Ruby string encoding/decoding methods
to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/ruby'

"hello\nworld\n".ruby_escape
# => "hello\\nworld\\n"

"hello".ruby_encode
# => "\\x68\\x65\\x6c\\x6c\\x6f"

"hello\nworld\n".ruby_string
# => "\"hello\\nworld\\n\""

"\x68\x65\x6c\x6c\x6f\x20\x77\x6f\x72\x6c\x64".ruby_unescape
# => "hello world"

"\"hello\\nworld\"".ruby_unquote
# => "hello\nworld"
```

## Shell

[ronin-support][ronin-support-docs] adds Shell string encoding/decoding methods
to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/shell'

"hello\nworld".shell_escape
# => "hello\\nworld"

"hello world".shell_encode
# => "\\x68\\x65\\x6c\\x6c\\x6f\\x0a\\x77\\x6f\\x72\\x6c\\x64"

"hello world".shell_string
# => "\"hello world\""
"hello\nworld".shell_string
# => "$'hello\\nworld'"

"hello\\nworld".shell_unescape
# => "hello\nworld"

"\"hello \\\"world\\\"\"".shell_unquote
# => "hello \"world\""
"'hello\\'world'".shell_unquote
# => "hello'world"
"$'hello\\nworld'".shell_unquote
# => "hello\nworld"
```

[ronin-support][ronin-support-docs] also adds
[shell_encode][Integer#shell_encode] and
[shell_escape][Integer#shell_escape] methods to Ruby's built-in [Integer] class:

[Integer#shell_encode]: /docs/ronin-support/Integer.html#shell_encode-instance_method
[Integer#shell_escape]: /docs/ronin-support/Integer.html#shell_escape-instance_method

```ruby
0x41.shell_escape
# => "A"
0x08.shell_escape
# => "\b"
0xff.shell_escape
# => "\xff"

0x41.shell_encode
# => "\\x41"
0x0a.shell_encode
# => "\\n"
```

## SQL

[ronin-support][ronin-support-docs] adds SQL string encoding/decoding methods
to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/sql'

"O'Brian".sql_escape
# => "'O''Brian'"

"/etc/passwd".sql_encode
# => "0x2f6574632f706173737764"

"'O''Brian'".sql_unescape
# => "O'Brian"

"'Conan O''Brian'".sql_decode
# => "Conan O'Brian"
"2f6574632f706173737764".sql_decode
# => "/etc/passwd"
```

## URI

[ronin-support][ronin-support-docs] adds URI string encoding/decoding methods
to Ruby's built-in [String] class:

```ruby
require 'ronin/support/encoding/uri'

"x > y".uri_escape
# => "x%20%3E%20y"

"plain text".uri_encode
# => "%70%6C%61%69%6E%20%74%65%78%74"

"sweet%20%26%20sour".uri_unescape
# => "sweet & sour"
```

[ronin-support][ronin-support-docs] also adds [uri_encode][Integer#uri_encode]
and [uri_escape][Integer#uri_escape] methods to Ruby's built-in [Integer] class:

[Integer#uri_encode]: /docs/ronin-support/Integer.html#uri_encode-instance_method
[Integer#uri_escape]: /docs/ronin-support/Integer.html#uri_escape-instance_method

```ruby
0x41.uri_escape
# => "A"
0x3d.uri_escape
# => "%3D"

0x41.uri_encode
# => "%41"
```

## UUencoding

[ronin-support][ronin-support-docs] adds [UUencoding][uuencoding]
encoding/decoding methods to Ruby's built-in [String] class:

[uuencoding]: https://en.wikipedia.org/wiki/Uuencoding

```ruby
require 'ronin/support/encoding/uuencoding'

"hello world".uu_encode
# => "+:&5L;&\\@=V]R;&0`\n"

"+:&5L;&\\@=V]R;&0`\n".uu_decode
# => "hello world"
```

## XML

[ronin-support][ronin-support-docs] adds XML encoding/decoding methods to Ruby's
built-in [String] class:

```ruby
require 'ronin/support/encoding/xml'

"one & two".xml_escape
# => "one &amp; two"

"abc".xml_encode
# => "&#97;&#98;&#99;"

"&lt;p&gt;one &lt;span&gt;two&lt;/span&gt;&lt;/p&gt;".xml_unescape
# => "<p>one <span>two</span></p>"
```

[ronin-support][ronin-support-docs] also adds [xml_encode][Integer#xml_encode]
and [xml_escape][Integer#xml_escape] methods to Ruby's built-in [Integer] class:

[Integer#xml_encode]: /docs/ronin-support/Integer.html#xml_encode-instance_method
[Integer#xml_escape]: /docs/ronin-support/Integer.html#xml_escape-instance_method

```ruby
0x26.xml_escape
# => "&amp;"

0x41.xml_encode
# => "&#65;"
```

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
[Integer]: /docs/ronin-support/Integer.html

<div class="level">
  <div class="level-left">
    <a class="button" href="index.html">
      &laquo; Index
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="binary.html">
      Binary &raquo;
    </a>
  </div>
</div>
