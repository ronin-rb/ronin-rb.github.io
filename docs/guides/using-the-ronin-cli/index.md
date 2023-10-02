---
layout: page
title: Docs - Using the Ronin CLI
---

# Using the Ronin CLI

Ronin provides the main `ronin` command which has many useful sub-commands of
it's own, as well as other `ronin-*` command each with their own sub-commands.
The purpose of the Ronin CLI is to both automate common tasks, and show off the
potential of Ronin's libraries and APIs.

## Table of Contents

* [Help](#help)
* [Running a Command](#running-a-command)
* [Available Commands](#available-commands)
* [Other `ronin-*` Commands](#other-ronin--commands)

## Help

To list all available `ronin` sub-commands and other `ronin-*` commands, simply
run `ronin help` in the terminal:

```
$ ronin help
Usage: ronin [options]

Options:
    -V, --version                    Prints the version and exits
    -h, --help                       Print help information

Arguments:
    [COMMAND]                        The command name to run
    [ARGS ...]                       Additional arguments for the command

Commands:
    asn
    banner-grab
    bitflip
    cert-dump
    cert-gen
    cert-grab
    decode, dec
    decrypt
    dns
    email-addr
    encode, enc
    encrypt
    entropy
    escape
    extract
    grep
    help
    hexdump
    highlight
    hmac
    homoglyph
    host
    http
    ip
    iprange
    irb
    md5
    netcat, nc
    new
    proxy
    public-suffix-list
    quote
    rot
    sha1
    sha256
    sha512
    strings
    tips
    tld-list
    typo
    typosquat
    unescape
    unhexdump
    unquote
    url
    xor

Additional Ronin Commands:
    $ ronin-repos
    $ ronin-db
    $ ronin-web
    $ ronin-fuzzer
    $ ronin-payloads
    $ ronin-exploits
    $ ronin-vulns

```

To view the help information for an individual `ronin` sub-command, run
`ronin help <sub-command-name-here>`.

```
ronin help md5
```

This will open the man-page for the given sub-command.

```
ronin-md5(1)                          User Manuals                          ronin-md5(1)

SYNOPSIS
       ronin md5 [options] [FILE ...]

DESCRIPTION
       Calculates MD5 hashes of data.

ARGUMENTS
       FILE   The optional file to read and process. If no FILE arguments are given, in‐
              put will be read from stdin.

OPTIONS
       -f, --file FILE
              Optional file to process.

       --string STRING
              Optional string to process.

       -M, --multiline
              Process each line of input separately.

       -n, --keep-newlines
              Preserves newlines at the end of each line.
...
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
If you want the raw `--help` output of a sub-command, try running
`ronin <sub-command-name-here> --help | less`.
  </div>
</article>

## Running a Command

To run a `ronin` sub-command, run `ronin` with the sub-command name and any
additional options and/or arguments.

```
$ ronin md5 --string "test"
098f6bcd4621d373cade4e832627b4f6
```

## Available Commands

* [Binary](binary.html)
  * [hexdump](binary.html#hexdump)
  * [unhexdump](binary.html#unhexdump)
  * [strings](binary.html#strings)
  * [bitflip](binary.html#bitflip)
* [Cryptography](cryptography.html)
  * [md5](cryptography.html#md5)
  * [sha1](cryptography.html#sha1)
  * [sha256](cryptography.html#sha256)
  * [sha512](cryptography.html#sha512)
  * [hmac](cryptography.html#hmac)
  * [encrypt](cryptography.html#encrypt)
  * [decrypt](cryptography.html#decrypt)
  * [rot](cryptography.html#rot)
  * [xor](cryptography.html#xor)
* [Encoding](encoding.html)
  * [encode](encoding.html#encode)
  * [decode](encoding.html#decode)
  * [escape](encoding.html#escape)
  * [unescape](encoding.html#unescape)
  * [quote](encoding.html#quote)
  * [unquote](encoding.html#unquote)
* [Networking](networking.html)
  * [asn](networking.html#asn)
  * [ip](networking.html#ip)
  * [iprange](networking.html#iprange)
  * [netcat](networking.html#netcat)
  * [dns](networking.html#dns)
  * [host](networking.html#host)
  * [typosquat](networking.html#typosquat)
  * [cert-dump](networking.html#cert-dump)
  * [cert-grab](networking.html#cert-grab)
  * [cert-gen](networking.html#cert-gen)
  * [http](networking.html#http)
  * [url](networking.html#url)
* [Text](text.html)
  * [email-addr](text.html#email-addr)
  * [entropy](text.html#entropy)
  * [grep](text.html#grep)
  * [extract](text.html#extract)
  * [typo](text.html#typo)
  * [homoglyph](text.html#homoglyph)
  * [syntax-highlight](text.html#syntax-highlight)
* [Misc](misc.html)
  * [irb](misc.html#irb)
  * [tips](misc.html#tips)
  * [new](misc.html#new)

## Other `ronin-*` Commands

You may have noticed that the output of `ronin help` lists other `ronin-*`
commands. The Ronin CLI isn't just the main `ronin` command, but is split up
into multiple other CLIs. These other `ronin-` commands each have their own
sub-commands with their own man-pages.

* [ronin-db](https://github.com/ronin-rb/ronin-db#synopsis)
* [ronin-repos](https://github.com/ronin-rb/ronin-repos#synopsis)
* [ronin-exploits](https://github.com/ronin-rb/ronin-exploits#synopsis)
* [ronin-payloads](https://github.com/ronin-rb/ronin-payloads#synopsis)
* [ronin-vulns](https://github.com/ronin-rb/ronin-vulns#synopsis)
* [ronin-fuzzer](https://github.com/ronin-rb/ronin-fuzzer#synopsis)

<div class="level">
  <div class="level-left">
    <a class="button" href="../getting-started/">
      &laquo; Getting Started
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="/docs/#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="../using-ronin-db/">
      Using Ronin DB &raquo;
    </a>
  </div>
</div>
