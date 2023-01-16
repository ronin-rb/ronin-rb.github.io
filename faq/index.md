---
layout: default
title: Frequently Asked Questions
---

# Frequently Asked Questions

## What is Ronin

{% include description.md %}

### What language is Ronin written in?

[Ruby][ruby]

### What version of Ruby should I run Ronin on?

Ronin requires [ruby] >= 3.0.0

<!--
Ronin can run on:

* [JRuby](https://jruby.org/)
* [TruffleRuby](https://github.com/oracle/truffleruby)
-->

### What is Ronin licensed under?

The main [ronin gem][ronin] and the [ronin-web gem][ronin-web] are licensed
under the [GPL-3.0].

The rest of the gems are licensed under the [LGPL-3.0].

[GPL-3.0]: https://gplv3.fsf.org/
[LGPL-3.0]: https://www.gnu.org/licenses/lgpl-3.0.html

### How well documented is Ronin?

Ronin has extensive [YARD] documentation covering it's [API][api-docs].
Most Ronin libraries have a YARD documentation coverage measurement of +80%.

[YARD]: https://yardoc.org/
[api-docs]: /docs/#api

### Does Ronin have a command-line interface (CLI)?

Why yes. Ronin's design allows for the libraries of Ronin
to add sub-commands to the main `ronin` command.
To view all available commands simply run the following command:

```shell
ronin help
```

To view the help information of a specific command:

```shell
ronin help COMMAND_NAME
```

### Does Ronin have a Discord server?

Why yes, Ronin does have a [Discord server]({{ site.discord_link }})
you can join.

### Does Ronin have a Twitter account that I can follow?

Why yes, you can follow [@ronin_rb](https://twitter.com/ronin_rb) on Twitter.

### Does Ronin have a Mastodon account that I can follow?

Why yes, you can follow
[@ronin_rb@infosec.exchange](https://infosec.exchange/@ronin_rb).

## Ruby

### Why choose Ruby instead of Python?

[Ruby][ruby]'s syntax and features are much more flexible than Python's and
save the programmer time by giving them many ways to do things. [Ruby][ruby]
also has a far better Object Model (literal *everything* is an Object) which
allows writing formal Object Orientated code.

### What is the easiest way to install Ruby?

#### Option 1: Package Manager

Probably the easiest way to install [ruby] is from your system's package
manager:

* **macOS** ([Homebrew](https://brew.sh/)): `sudo brew install ruby`
* **Debian** / **Ubuntu**: `sudo apt install ruby-full`
* **Fedora**: `sudo dnf install ruby-devel`
* **OpenSUSE**: `sudo zypper -n in -l ruby-devel`
* **Arch**: `sudo pacman install community/ruby`

#### Option 2: Ruby version Manager

Another method for installing [ruby] which is preferred by developers is using
a Ruby Version Manager:

* [rbenv](https://github.com/rbenv/rbenv#readme)
* [chruby](https://github.com/postmodern/chruby#readme) +
  [ruby-install](https://github.com/postmodern/ruby-install#readme)
* [RVM](https://rvm.io/)

### What are some good resources for learning Ruby?

#### Online Resources

* [Try Ruby](https://try.ruby-lang.org/)
* [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
* [Exercism](https://exercism.org/tracks/ruby)

#### Books

* [Programming Ruby 3.2 (5th Edition)](https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/)
* [The Well-Grounded Rubyist, Third Edition](https://www.manning.com/books/the-well-grounded-rubyist-third-edition)
* [Practical Object-Oriented Design in Ruby: An Agile Primer](https://www.poodr.com/)

## Exploits

### Does Ronin have builtin exploits?

Ronin does not ship with any builtin exploits, but
it is extremely easy to write your own exploits using
[ronin-exploits](https://github.com/ronin-rb/ronin-exploits#examples)
and distribute them via [3rd party repositories](#3rd-party-repositories).

## 3rd party repositories

### What is a 3rd party repository?

Ronin supports installing 3rd party repositories of additional payload or
exploits. 3rd party repositories are essentially a [git] repository that can
have a `exploits/` or `payloads/` directory that contains Ruby exploit or
payload files, [ronin-exploits] or [ronin-payloads] can then load.

### How are 3rd party repositories hosted?

3rd party repositories use [git] and anyone can host their own 3rd party
repository on any popular git hosting services, such as
[GitHub] or [GitLab].

### How can I install a 3rd party repository with Ronin?

Simply pass the [git] URL to the `ronin-repos install` command:

```shell
ronin-repos install https://github.com/user/repo.git
```

### How can I generate my own 3rd party repository?

You can generate your own new 3rd party repository using the
`ronin-repos new` command:

```shell
ronin-repos new path/to/repo
```

Then simply publish the git repository to [GitHub] or [GitLab].

## Quality

### How readable is Ronin's code-base?

Ronin strives to have extremely clean and readable code. Most Ronin libraries
have a [CodeClimate Maintainability score] of **A** or **B**.

[CodeClimate Maintainability score]: https://docs.codeclimate.com/docs/maintainability

### Does Ronin have a test-suite so that I can ensure that Ronin is bug free?

Yes, Ronin has an extensive [RSpec] test suite. Most Ronin libraries have a
[SimpleCov] coverage measurement of +90%.

## Development

### Where is Ronin's code-base hosted?

Ronin and it's many libraries are hosted on [GitHub][ronin-rb].

### What do I need in order to contribute to Ronin?

1. Knowledge of [git].
2. A [GitHub] account.
3. Knowledge of [Ruby][ruby].

If you just want to fix a typo in the documentation, then you can edit the
documentation entirely via [GitHub]'s website and submit a [pull request].

[pull request]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests

[RSpec]: https://rspec.info/
[SimpleCov]: https://github.com/simplecov-ruby/simplecov#readme

[ruby]: https://www.ruby-lang.org/
[git]: https://git-scm.com/

[GitHub]: https://github.com/
[GitLab]: https://gitlab.com/

[ronin-rb]: https://github.com/ronin-rb/
[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-fuzzer]: https://github.com/ronin-rb/ronin-fuzzer#readme
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-code-asm]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
