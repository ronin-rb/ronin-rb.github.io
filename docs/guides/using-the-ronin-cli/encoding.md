---
layout: page
title: Using the Ronin CLI - Encoding
---

# Using the Ronin CLI - Encoding

## Table of Contents

* [encode](#encode)
* [decode](#decode)
* [escape](#escape)
* [unescape](#unescape)
* [quote](#quote)
* [unquote](#unquote)

## encode

The `ronin encode` command can be used to encode a given String into a variety
of formats, such as [Base64]:

[Base64]: https://en.wikipedia.org/wiki/Base64

```shell
$ ronin encode --base64 --string "foo bar baz"
Zm9vIGJhciBiYXo=
```

Multiple encoding options can be specified, which will cause `ronin encode`
to encode the String with additional encodings in the order that the options
were given:

```shell
$ ronin encode --zlib --base64 --uri --string "foo bar"
%65%4A%78%4C%79%38%39%58%53%45%6F%73%41%67%41%4B%63%41%4B%61%0A
```

Supported string formats:

* `--base16` - Base16 decodes the data.
* `--base32` - Base32 decodes the data.
* `-b`, `--base64` - Base64 decodes the data.
* `-z`, `--zlib` - Zlib uncompresses the data.
* `-g`, `--gzip` - gzip uncompresses the data.
* `-c`, `--c` - Unescapes the data as a C string.
* `-X`, `--hex` - Unescapes the data as a hex string.
* `-H`, `--html` - HTML unescapes the data.
* `-u`, `--uri` - URI unescapes the data.
* `--http` - HTTP unescapes the data.
* `--js` - JavaScript unescapes the data.
* `-S`, `--shell` - Unescapes the data as a Shell string.
* `-P`, `--powershell` - Unescapes the data as a PowerShell string.
* `-Q`, `--quoted-printable` - Unescapes the data as Quoted Printable.
* `-R`, `--ruby` - Unescapes the data as a Ruby string.
* `-x`, `--xml` - XML unescapes the data.

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
The `ronin encode` command behaves the same as if you chained multiple Ruby
method calls together on a String:

```ruby
"foo bar".zlib_deflate.base64_encode.uri_encode
# => "%65%4A%78%4C%79%38%39%58%53%45%6F%73%41%67%41%4B%63%41%4B%61%0A"
```
  </div>
</article>

## decode

The `ronin decode` command can be used to encode a given String into a variety
of formats, such as [Base64]:

[Base64]: https://en.wikipedia.org/wiki/Base64

```shell
$ ronin decode --base64 --string "Zm9vIGJhciBiYXo="
foo bar baz
```

Multiple encoding options can be specified, which will cause `ronin decode`
to decode the String with additional encodings in the order that the options
were given:

```shell
$ ronin decode --uri --base64 --zlib --string "%65%4A%78%4C%79%38%39%58%53%45%6F%73%41%67%41%4B%63%41%4B%61%0A"
foo bar
```

Supported string formats:

* `--base16` - Base16 decodes the data.
* `--base32` - Base32 decodes the data.
* `-b`, `--base64` - Base64 decodes the data.
* `-z`, `--zlib` - Zlib uncompresses the data.
* `-g`, `--gzip` - gzip uncompresses the data.
* `-c`, `--c` - Unescapes the data as a C string.
* `-X`, `--hex` - Unescapes the data as a hex string.
* `-H`, `--html` - HTML unescapes the data.
* `-u`, `--uri` - URI unescapes the data.
* `--http` - HTTP unescapes the data.
* `--js` - JavaScript unescapes the data.
* `-S`, `--shell` - Unescapes the data as a Shell string.
* `-P`, `--powershell` - Unescapes the data as a PowerShell string.
* `-Q`, `--quoted-printable` - Unescapes the data as Quoted Printable.
* `-R`, `--ruby` - Unescapes the data as a Ruby string.
* `-x`, `--xml` - XML unescapes the data.

## escape

The `ronin escape` command is similar to the `ronin encode` command, except that
it only escapes special characters:

```shell
$ ronin escape --uri --string "foo bar"
foo%20bar
```

Supported string formats:

* `-c`, `--c` - Unescapes the data as a C string.
* `-X`, `--hex` - Unescapes the data as a hex string.
* `-H`, `--html` - HTML unescapes the data.
* `-u`, `--uri` - URI unescapes the data.
* `--http` - HTTP unescapes the data.
* `--js` - JavaScript unescapes the data.
* `-S`, `--shell` - Unescapes the data as a Shell string.
* `-P`, `--powershell` - Unescapes the data as a PowerShell string.
* `-Q`, `--quoted-printable` - Unescapes the data as Quoted Printable.
* `-R`, `--ruby` - Unescapes the data as a Ruby string.
* `-x`, `--xml` - XML unescapes the data.

## unescape

The `ronin unescape` command is the opposite of the `ronin escape` command,
and will decode escaped special characters:

```shell
$ ronin unescape --uri --string "foo%20bar"
foo bar
```

Supported string formats:

* `-c`, `--c` - Unescapes the data as a C string.
* `-X`, `--hex` - Unescapes the data as a hex string.
* `-H`, `--html` - HTML unescapes the data.
* `-u`, `--uri` - URI unescapes the data.
* `--http` - HTTP unescapes the data.
* `--js` - JavaScript unescapes the data.
* `-S`, `--shell` - Unescapes the data as a Shell string.
* `-P`, `--powershell` - Unescapes the data as a PowerShell string.
* `-Q`, `--quoted-printable` - Unescapes the data as Quoted Printable.
* `-R`, `--ruby` - Unescapes the data as a Ruby string.
* `-x`, `--xml` - XML unescapes the data.

## quote

The `ronin quote` command will escape and quote a given file or string for a
variety of languages or formats:

```shell
$ ronin quote --c file.bin
"..."
```

Supported string formats:

* `-X`,`--hex` - quotes the data as a Hex string.
* `-c`,`--c` - quotes the data as a C string.
* `-j`,`--js` - quotes the data as a JavaScript string.
* `-S`,`--shell` - quotes the data as a Shell string.
* `-P`, `--powershell` - quotes the data as a PowerShell string.
* `-R`, `--ruby` - quotes the data as a Ruby String.

## unquote

The `ronin unquote` command is the opposite of the `ronin quote` command,
and will convert a quoted string back into it's raw format:

```shell
$ ronin unquote --c --string '"\x66\x6f\x6f\x20\x62\x61\x72"'
foo bar
```

Supported string formats:

* `-X`,`--hex` - quotes the data as a Hex string.
* `-c`,`--c` - quotes the data as a C string.
* `-j`,`--js` - quotes the data as a JavaScript string.
* `-S`,`--shell` - quotes the data as a Shell string.
* `-P`, `--powershell` - quotes the data as a PowerShell string.
* `-R`, `--ruby` - quotes the data as a Ruby String.

<div class="level">
  <div class="level-left">
    <a class="button" href="cryptography.html">
      &laquo; Cryptography
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="networking.html">
      Networking &raquo;
    </a>
  </div>
</div>
