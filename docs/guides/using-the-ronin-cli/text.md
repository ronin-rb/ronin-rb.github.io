---
layout: page
title: Using the Ronin CLI - Text
---

# Using the Ronin CLI - Text

## Table of Contents

* [entropy](#entropy)
* [grep](#grep)
* [extract](#extract)
* [typo](#typo)
* [homoglyph](#homoglyph)
* [syntax-highlight](#syntax-highlight)

## entropy

The `ronin entropy` command extracts high entropy text, such as API keys or
passwords:

```shell
ronin entropy -e 5.0 index.html
```

## grep

The `ronin grep` command is similar to the `grep` command, but has options for
common patterns:

```shell
ronin grep --hash index.html
ronin grep --host index.html
ronin grep --url index.html
```

## extract

The `ronin extract` command is similar to the `ronin grep` command, but instead
of printing the matched text it will only print the matched text:

```shell
ronin extract --hash index.html
ronin extract --host index.html
ronin extract --url index.html
```

## typo

The `ronin typo` command allows generating typos for a given word:

```shell
$ ronin typo microsoft
microssoft
```

The `ronin typo` also allows enumerating over every typo variation of a word:

```shell
$ ronin typo --enum microsoft
microosoft
microsooft
microssoft
```

## homoglyph

The `ronin homoglyph` command allows generating [homoglyph] variations of a
given word:

[homoglyph]: https://en.wikipedia.org/wiki/Homoglyph

```shell
$ ronin homoglyph CEO
CＥO
```

The `ronin homoglyph` also allows enumerating over every homoglyph variation of
a word:

```shell
$ ronin homoglyph --enum CEO
ϹEO
СEO
ⅭEO
ＣEO
CΕO
CЕO
CＥO
CEΟ
CEО
CEＯ
```

## syntax-highlight

The `ronin syntax-highlight` command allows syntax highlighting a given file
and outputting it with ANSI coloring:

```shell
ronin highlight index.html
```

<div class="level">
  <div class="level-left">
    <a class="button" href="networking.html">
      &laquo; Networking
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="misc.html">
      Misc &raquo;
    </a>
  </div>
</div>
