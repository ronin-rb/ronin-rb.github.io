---
layout: post
title: ronin-support 0.5.2 and ronin 1.5.1 released!
author: postmodern
tags:
  - ronin
  - ronin-support
  - release
  - ruby 3.0
---

[ronin-support][ronin-support] [0.5.2][1] and [ronin][ronin] [1.5.1][2] have been released!

### Install

    $ gem install install -v 1.5.1

### Update

    $ gem update ronin-support ronin

### Bundler

    $ bundle update ronin-support ronin

## What's New

### Ruby 3.0 Support

These releases mainly contains minor bug fixes, but most importantly it adds
support for [Ruby 3.0]!

    $ chruby ruby-3.0
    $ gem install ronin
    ...
    $ ronin
    >> RONIN_VERSION
    => "1.5.1"
    >> RUBY_VERSION
    => "3.0.0"

## ChangeLogs

* [ronin-support 0.5.2][3]
* [ronin 1.5.1][4]

## Checksums

* `ronin-support-0.5.2.gem`:
  * **SHA256**: `1b48cd59db44e6a91e46c2f8ee469d86701571352540ad0ce61f8ad2d18c632d`
  * **SHA512**:
    `735b24c2e57ffae494bcb07d5da2ca87514a670b2b853e7a81e2e4ee4ca793c326245fe659433e0e1cf674893390b655c65dbad8d562d0f48001dd4b3551ed23`
  * [PGP][ronin-support-0.5.2.gem.asc]
* `ronin-1.5.1.gem`:
  * **SHA256**: `ea79d74e610c3d92b2e4c58dba23ff7d185dd1a7852bea6023bcb94eb835b471`
  * **SHA512**: `6c2ea5cbaf975c668f4fc5005db658da1de102ae9549daed615061c2c942c714d10a9ffb594839f3c6998d7a8f32035f937d8cb9f56f8e96586c0a3511de78b8`
  * [PGP][ronin-1.5.1.gem.asc]

[1]: https://rubygems.org/gems/ronin-support/versions/0.5.2
[2]: https://rubygems.org/gems/ronin/versions/1.5.1
[3]: https://github.com/ronin-rb/ronin-support/blob/main/ChangeLog.md#052--2021-02-28
[4]: https://github.com/ronin-rb/ronin/blob/main/ChangeLog.md#151--2021-02-28

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin]: https://github.com/ronin-rb/ronin#readme
[Ruby 3.0]: https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/
[ronin-support-0.5.2.gem.asc]: https://github.com/ronin-rb/ronin-support/releases/download/v0.5.2/ronin-support-0.5.2.gem.asc
[ronin-1.5.1.gem.asc]: https://github.com/ronin-rb/ronin/releases/download/v1.5.1/ronin-1.5.1.gem.asc
