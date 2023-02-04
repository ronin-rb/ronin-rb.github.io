---
layout: post
title: Ronin 2.0.0 finally released!
author: postmodern
tags:
 - ronin-support
 - ronin-core
 - ronin-repos
 - ronin-db
 - ronin-db-activerecord
 - ronin-code-asm
 - ronin-code-sql
 - ronin-web-server
 - ronin-web-spider
 - ronin-web-user_agents
 - ronin-web
 - ronin-vulns
 - ronin-post_ex
 - ronin-payloads
 - ronin-exploits
 - ronin-fuzzer
 - ronin
---

After nearly a full year of non-stop development since the initial
announcement of [The Big Refactor][1], **4153** commits made,
[700 issues closed][2], and a month of beta testing,
[Ronin][ronin] [2.0.0][ronin-2.0.0] has _finally_ been released!

## What is Ronin?

{% include description.md %}

## Install

[Ronin][ronin] can be installed via the [`ronin-install.sh`][ronin-install.sh]
installer bash script:

{% include install_script.md %}

[ronin-install.sh]: https://github.com/ronin-rb/scripts#ronin-installsh

### Docker

[Ronin][ronin] also has [docker images][dockerhub], if you prefer using [docker].

{% include docker_install.md %}

[docker]: https://www.docker.com/
[dockerhub]: https://hub.docker.com/r/roninrb/ronin

## What's New?

* Many new APIs were added to [ronin-support] that allow working with
  [various data encodings][Ronin::Support::Encoding],
  [encoding/decoding binary data][Ronin::Support::Binary],
  [bit-flipping][Ronin::Support::Binary::BitFlip],
  [cryptography][Ronin::Support::Crypto],
  [compressing/uncompressing data][Ronin::Support::Compression],
  [reading/writing tar/zip archives][Ronin::Support::Archive],
  [querying ASNs][Ronin::Support::Network::ASN],
  [parsing/enumerating TLDs][Ronin::Support::Network::TLD],
  [parsing/enumerating Public Suffixes][Ronin::Support::Network::PublicSuffix],
  [enumerating IP ranges][Ronin::Support::Network::IPRange], and
  [more][ronin-support-docs].
* Many new [CLI commands][ronin-synopsis] were added to the main [ronin]
  command.
* [ronin-repos] allows you to easily install and manage 3rd party git
  repositories of exploits, payloads, etc.
* [ronin-db] allows managing databases, importing recon data, and query data.
* [ronin-db-activerecord] provides [ActiveRecord] models for [ronin-db] and
  can be embedded into other Ruby apps, utils, or libraries.
* [ronin-payloads] provides a stable API for writing custom payloads for
  exploits. It also ships with many [common bind shell and reverse shell
  payloads][ronin-payloads-synopsis].
* [ronin-exploits] now has a stable API for writing custom exploits. It also
  has a [CLI][ronin-exploits-synopsis] for generating and running exploits.
* [ronin-vulns] provides classes for testing and exploiting URLs for common web
  vulnerabilities, such as Local File Inclusion (LFI),
  Remote File Inclusion (RFI), SQL injection (SQLi), reflective Cross Site
  Scripting (XSS), Server Side Template Injection (SSTI), and Open Redirects.
  It also has a [CLI][ronin-vulns-synopsis] for testing URLs.
* New micro-libraries were created, such as [ronin-web-user_agents],
  [ronin-web-server], and [ronin-web-spider].

## What Do You Get?

### A Powerful CLI

[Ronin][ronin] provides many powerful [CLI commands][ronin-synopsis]:

<object class="demo" data="/images/demos/ronin_http.svg" type="image/svg+xml"></object>

<object class="demo" data="/images/demos/ronin_grep_extract.svg" type="image/svg+xml"></object>

<object class="demo" data="/images/demos/ronin_dns_enum.svg" type="image/svg+xml"></object>

See [ronin's README][ronin-synopsis] for more command examples.

### Powerful Ruby APIs

[Ronin] is made up of different Ruby [libraries][ronin-rb] and
[powerful APIs][docs-api], that you can use in Ruby scripts, other Ruby apps,
or in the Ruby console.

{% include examples/dns_enum.rb.html %}

See the [API documentation][docs-api] for more documentation and examples.

### A Rich Ecosystem

| [ronin] | The main ruby gem that provides the main [`ronin` command][ronin-synopsis] and pulls in the other `ronin-` gems as dependencies. |
| [ronin-support] | A support library for other [ronin-rb] libraries which provides most of the APIs and core-extensions which make Ruby much easier to use. **tl;dr** It's like [pwntools] combined with [activesupport]. |
| [ronin-core] | A "core" library which provides internal APIs for the other [ronin-rb] libraries. |
| [ronin-repos] | Supports installing and managing 3rd party git repositories of exploits, payloads, or potentially any other type of Ruby code. Other libraries such as [ronin-exploits] and [ronin-payloads] can load modules from git repositories installed via [ronin-repos]. |
| [ronin-db-activerecord] | Defines the [ActiveRecord] models and migrations for the [ronin-db]. [ronin-db-activerecord] can be used by other Ruby libraries or apps. |
| [ronin-db] | Provides a command-line interface (CLI) to [ronin-db-activerecord]. It provides the [`ronin-db` command][ronin-db-synopsis] for managing and querying database(s). |
| [ronin-web-server] | A small library which provides a [Sinatra][sinatra] based web server customized specifically for security related tasks. It provides additional routing methods, routing conditions, helper methods, as well as a reverse proxy. |
| [ronin-web-spider] | A small library that builds on top of the battle tested [spidr] library. It provides additional callback methods that are relevant to recon, such as `every_host`, `every_cert`, `every_favicon`, `every_javascript`, `every_javascript_string`, `every_javascript_comment`, `every_html_comment`, and `every_comment`. |
| [ronin-web-user_agents] | A small library for generating random but realistic looking `User-Agent` strings for a variety of web browsers, OSes, devices, etc. |
| [ronin-web] | Brings together all of the other `ronin-web-` libraries and provides the [`ronin-web` command][ronin-web-synopsis] which provides numerous handy web related commands, such as `diff`, `html`, `reverse-proxy`, `server`, and `spider`. |
| [ronin-code-asm] | A Ruby DSL for writing assembly in pure-Ruby. It can assemble full programs or be used to write shellcode. |
| [ronin-code-sql] | A Ruby DSL for crafting SQL injections. It can also generate obfuscated SQL for bypassing filters. |
| [ronin-vulns] | A Ruby library for blind vulnerability testing. It can test for Local File Inclusion (LFI), Remote File Inclusion (RFI), SQL injection (SQLi), reflective Cross Site Scripting (XSS), Server Side Template Injection (SSTI), and Open Redirects. |
| [ronin-post_ex] | A Post-Exploitation API for [interacting with compromised systems][ronin-post_ex-examples]. [ronin-post_ex] is used by both [ronin-payloads] and [ronin-exploits]. |
| [ronin-payloads] | A Ruby micro-framework for writing exploit payloads as plain old Ruby classes. [ronin-payloads] comes with common payloads (ex: `exec_shell`, `bind_shell`, `reverse_shell`) and can also load 3rd party payloads from [ronin-repos]. |
| [ronin-exploits] | A Ruby micro-framework for writing and running exploits. [ronin-exploits] allows one to write exploits as plain old Ruby classes. [ronin-exploits] can load and run 3rd party exploits from either Ruby files or from [ronin-repos]. **tl;dr** It's like a simpler and more modular version of [Metasploit]. |
| [ronin-fuzzer] | A Ruby library and CLI for generating, mutating, and fuzzing data. The goal of [ronin-fuzzer] is to be as configurable as possible. |

## Interested?

Does Ronin interest you? Do you have an idea for a feature or a new `ronin-`
library? Checkout our [GitHub], join our [Discord server], follow us on
[Twitter] or [Mastodon], and get involved!

## Special Thanks

A special thank you to everyone who participated in the [Open Beta][3]. Also, a
special thank you to everyone who voted in my *many* Twitter/Mastodon polls,
which helped shape Ronin's design.

[1]: /blog/2022/01/29/announcing-the-big-refactor.html
[2]: https://github.com/orgs/ronin-rb/projects/2
[3]: /blog/2023/01/01/announcing-the-ronin-2-0-0-open-beta.html

[GitHub]: https://github.com/ronin-rb
[Discord server]: {{ site.discord_link }}
[Twitter]: https://twitter.com/ronin_rb
[Mastodon]: https://infosec.exchange/@ronin_rb

[docs-api]: /docs/#api

[ronin-rb]: https://github.com/ronin-rb
[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-synopsis]: https://github.com/ronin-rb/ronin#synopsis
[ronin-2.0.0]: https://rubygems.org/gems/ronin/versions/2.0.0
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-synopsis]: https://github.com/ronin-rb/ronin-db#synopsis
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-web-synopsis]: https://github.com/ronin-rb/ronin-web#synopsis
[ronin-code-asm]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-synopsis]: https://github.com/ronin-rb/ronin-vulns#synopsis
[ronin-post_ex]: https://github.com/ronin-rb/ronin-post_ex#readme
[ronin-post_ex-examples]: https://github.com/ronin-rb/ronin-post_ex#examples
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-payloads-synopsis]: https://github.com/ronin-rb/ronin-payloads#synopsis
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-exploits-synopsis]: https://github.com/ronin-rb/ronin-exploits#synopsis
[ronin-fuzzer]: https://github.com/ronin-rb/ronin-fuzzer#readme

[ronin-support-docs]: /docs/ronin-support/
[Ronin::Support::Encoding]: /docs/ronin-support/Ronin/Support/Encoding.html
[Ronin::Support::Binary]: /docs/ronin-support/Ronin/Support/Binary.html
[Ronin::Support::Binary::BitFlip]: /docs/ronin-support/Ronin/Support/Binary/BitFlip.html
[Ronin::Support::Crypto]: /docs/ronin-support/Ronin/Support/Crypto.html
[Ronin::Support::Compression]: /docs/ronin-support/Ronin/Support/Compression.html
[Ronin::Support::Archive]: /docs/ronin-support/Ronin/Support/Archive.html
[Ronin::Support::Network::ASN]: /docs/ronin-support/Ronin/Support/Network/ASN.html
[Ronin::Support::Network::TLD]: /docs/ronin-support/Ronin/Support/Network/TLD.html
[Ronin::Support::Network::PublicSuffix]: /docs/ronin-support/Ronin/Support/Network/PublicSuffix.html
[Ronin::Support::Network::IPRange]: /docs/ronin-support/Ronin/Support/Network/IPRange.html

[pwntools]: https://github.com/Gallopsled/pwntools#readme
[activesupport]: https://guides.rubyonrails.org/active_support_core_extensions.html
[ActiveRecord]: https://guides.rubyonrails.org/active_record_basics.html
[sinatra]: https://sinatrarb.com/
[spidr]: https://github.com/postmodern/spidr#readme
[Metasploit]: https://metasploit.com
