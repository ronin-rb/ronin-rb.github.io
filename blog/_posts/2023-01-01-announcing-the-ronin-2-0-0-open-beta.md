---
layout: post
title: Announcing the Ronin 2.0.0 Open Beta
author: postmodern
tags:
 - refactor
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

Now that [the Big Refactor has been completed][1], and the first beta versions
of Ronin 2.0.0 and the other `ronin-` gems have been released, it is finally
time to begin the Open Beta Testing phase.

[1]: /blog/2022/12/30/the-big-refactor-is-done.html

## What is Ronin?

Ronin is a Ruby toolkit for security research and development. Ronin contains
many different CLI commands and Ruby libraries for a variety of security tasks,
such as encoding/decoding data, filter IPs/hosts/URLs, querying ASNs, querying
DNS, HTTP, scanning for web vulnerabilities, spidering websites, running
exploits, generating new exploits, managing local databases, fuzzing data, and
much more.

## Timeframe

The Open Beta will start on **January 1st, 2023** and will conclude on
**February 1st, 2023**.

## How To Participate

* Install Ronin 2.0.0 (beta).
* Test the commands.
* Test the Ruby libraries.
* Review the `README` files.
* Review the [API documentation](/docs/#api).
* Submit bug reports to the appropriate repositories for anything that does not
  work or does not make sense.

## How To Report Issues

Bugs or other issues should be reported to the relevant GitHub repository's
issue tracker. Additionally, questions can be posted in the GitHub repository's
forum (called "Discussions"). Each GitHub repository's issue tracker and
forum are linked below.

Finally, if you'd like to chat, we have a [Discord server] which beta testers
can join.

[Discord server]: {{ site.discord_link }}

## How To Install Ronin 2.0.0 (beta)

Ronin 2.0.0 (beta) and all of the other dependencies can be installed using the
new [ronin-install.sh] installation script with the `--pre` option flag.
Simply copy and paste the follow two commands into your terminal to download
and execute the installation script:

```shell
curl -o ronin-install.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh --pre
```

**Note:** the [ronin-install.sh] script will automatically install any
required external dependencies (ex: `ruby`, `libsqlite3`, etc) if they are not
already installed.

If you prefer using [Docker][docker], there are also [Docker images][dockerhub] 
available for Ubuntu, Fedora, and Alpine, that beta testers can also pull down
and run:

```shell
docker pull roninrb/ronin
docker run -it ronin
```

[ronin-install.sh]: https://github.com/ronin-rb/scripts#readme
[docker]: https://www.docker.com/
[dockerhub]: https://hub.docker.com/r/roninrb/ronin

## What's Installed

### ronin

[ronin] is the main ruby gem and provides the main
[`ronin` command][ronin-synopsis] and pulls in the other `ronin-` gems as a
dependencies.

[GitHub][ronin-github] \| [README][ronin-readme] \| [Synopsis][ronin-synopsis] \| [Issues][ronin-issues] \| [Forum][ronin-forum] \| [Documentation][ronin-docs]

[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-github]: https://github.com/ronin-rb/ronin
[ronin-readme]: https://github.com/ronin-rb/ronin#readme
[ronin-synopsis]: https://github.com/ronin-rb/ronin#synopsis
[ronin-issues]: https://github.com/ronin-rb/ronin/issues
[ronin-forum]: https://github.com/ronin-rb/ronin/discussions
[ronin-docs]: /docs/ronin/

### ronin-support

[ronin-support] is the support gem which provides most of the APIs and
core-extensions which make Ruby much easier to use. Users will typically use
[ronin-support]'s APIs in scripts, in the `ronin irb` console, or when writing
[payloads][ronin-payloads-examples] or [exploits][ronin-exploits-examples].
Think of [ronin-support] as a cross between Rails' [activesupport] and
[pwntools].

[GitHub][ronin-support-github] \| [README][ronin-support-readme] \| [Examples][ronin-support-examples] \| [Issues][ronin-support-issues] \| [Forum][ronin-support-forum] \| [Documentation][ronin-support-docs]

[activesupport]: https://guides.rubyonrails.org/active_support_core_extensions.html
[pwntools]: https://github.com/Gallopsled/pwntools#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-github]: https://github.com/ronin-rb/ronin-support
[ronin-support-readme]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-examples]: https://github.com/ronin-rb/ronin-support#examples
[ronin-support-issues]: https://github.com/ronin-rb/ronin-support/issues
[ronin-support-forum]: https://github.com/ronin-rb/ronin-support/discussions
[ronin-support-docs]: /docs/ronin-support/

### ronin-core

[ronin-core] is the "core" library which provides internal APIs for the other
`ronin-` libraries. Users do not interact with [ronin-core] directly, unless
they want to write their own `ronin-` library.

[GitHub][ronin-core-github] \| [README][ronin-core-readme] \| [Examples][ronin-core-examples] \| [Issues][ronin-core-issues] \| [Forum][ronin-core-forum] \| [Documentation][ronin-core-docs]

[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-core-github]: https://github.com/ronin-rb/ronin-core
[ronin-core-readme]: https://github.com/ronin-rb/ronin-core#readme
[ronin-core-examples]: https://github.com/ronin-rb/ronin-core#examples
[ronin-core-issues]: https://github.com/ronin-rb/ronin-core/issues
[ronin-core-forum]: https://github.com/ronin-rb/ronin-core/discussions
[ronin-core-docs]: /docs/ronin-core/

### ronin-repos

[ronin-repos] supports installing and managing 3rd party git repositories of
exploits, payloads, or potentially any other type of Ruby code. Other libraries
such as [ronin-exploits] and [ronin-payloads] can load modules from git
repositories installed via [ronin-repos].

[GitHub][ronin-repos-github] \| [README][ronin-repos-readme] \| [Synopsis][ronin-repos-synopsis] \| [Examples][ronin-repos-examples] \| [Issues][ronin-repos-issues] \| [Forum][ronin-repos-forum] \| [Documentation][ronin-repos-docs]

[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-repos-github]: https://github.com/ronin-rb/ronin-repos
[ronin-repos-readme]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-repos-synopsis]: https://github.com/ronin-rb/ronin-repos#synopsis
[ronin-repos-examples]: https://github.com/ronin-rb/ronin-repos#examples
[ronin-repos-issues]: https://github.com/ronin-rb/ronin-repos/issues
[ronin-repos-forum]: https://github.com/ronin-rb/ronin-repos/discussions
[ronin-repos-docs]: /docs/ronin-repos/

### ronin-db-activerecord

[ronin-db-activerecord] defines the [ActiveRecord] models and migrations for the
[ronin-db]. [ronin-db-activerecord] can be used by other Ruby libraries or apps.

[GitHub][ronin-db-activerecord-github] \| [README][ronin-db-activerecord-readme] \| [Examples][ronin-db-activerecord-examples] \| [Issues][ronin-db-activerecord-issues] \| [Forum][ronin-db-activerecord-forum] \| [Documentation][ronin-db-activerecord-docs]

[ActiveRecord]: https://guides.rubyonrails.org/active_record_basics.html
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord#readme
[ronin-db-activerecord-github]: https://github.com/ronin-rb/ronin-db-activerecord
[ronin-db-activerecord-readme]: https://github.com/ronin-rb/ronin-db-activerecord#readme
[ronin-db-activerecord-examples]: https://github.com/ronin-rb/ronin-db-activerecord#examples
[ronin-db-activerecord-issues]: https://github.com/ronin-rb/ronin-db-activerecord/issues
[ronin-db-activerecord-forum]: https://github.com/ronin-rb/ronin-db-activerecord/discussions
[ronin-db-activerecord-docs]: /docs/ronin-db-activerecord/

### ronin-db

[ronin-db] provides a command-line interface (CLI) to [ronin-db-activerecord]
It provides the [`ronin-db` command][ronin-db-synopsis] for managing
and querying database(s).

[GitHub][ronin-db-github] \| [README][ronin-db-readme] \| [Synopsis][ronin-db-synopsis] \| [Examples][ronin-db-examples] \| [Issues][ronin-db-issues] \| [Forum][ronin-db-forum] \| [Documentation][ronin-db-docs]

[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-github]: https://github.com/ronin-rb/ronin-db
[ronin-db-readme]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-synopsis]: https://github.com/ronin-rb/ronin-db#synopsis
[ronin-db-examples]: https://github.com/ronin-rb/ronin-db#examples
[ronin-db-issues]: https://github.com/ronin-rb/ronin-db/issues
[ronin-db-forum]: https://github.com/ronin-rb/ronin-db/discussions
[ronin-db-docs]: /docs/ronin-db/

### ronin-web-server

[ronin-web-server] is a small library which provides a [Sinatra][sinatra] based
web server customized specifically for security related tasks. It provides
additional routing methods, routing conditions, helper methods, as well as a
reverse proxy.

[GitHub][ronin-web-server-github] \| [README][ronin-web-server-readme] \| [Examples][ronin-web-server-examples] \| [Issues][ronin-web-server-issues] \| [Forum][ronin-web-server-forum] \| [Documentation][ronin-web-server-docs]

[sinatra]: https://sinatrarb.com/
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-server-github]: https://github.com/ronin-rb/ronin-web-server
[ronin-web-server-readme]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-server-examples]: https://github.com/ronin-rb/ronin-web-server#examples
[ronin-web-server-issues]: https://github.com/ronin-rb/ronin-web-server/issues
[ronin-web-server-forum]: https://github.com/ronin-rb/ronin-web-server/discussions
[ronin-web-server-docs]: /docs/ronin-web-server/

### ronin-web-spider

[ronin-web-spider] is a small library that builds on top of the battle tested
[spidr] library. It provides additional callback methods that are relevant to
recon, such as `every_host`, `every_cert`, `every_favicon`, `every_javascript`,
`every_javascript_string`, `every_javascript_comment`, `every_html_comment`,
and `every_comment`.

[GitHub][ronin-web-spider-github] \| [README][ronin-web-spider-readme] \| [Examples][ronin-web-spider-examples] \| [Issues][ronin-web-spider-issues] \| [Forum][ronin-web-spider-forum] \| [Documentation][ronin-web-spider-docs]

[spidr]: https://github.com/postmodern/spidr#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-spider-github]: https://github.com/ronin-rb/ronin-web-spider
[ronin-web-spider-readme]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-spider-examples]: https://github.com/ronin-rb/ronin-web-spider#examples
[ronin-web-spider-issues]: https://github.com/ronin-rb/ronin-web-spider/issues
[ronin-web-spider-forum]: https://github.com/ronin-rb/ronin-web-spider/discussions
[ronin-web-spider-docs]: /docs/ronin-web-spider/

### ronin-web-user_agents

[ronin-web-user_agents] is a small library for generating random but realistic
looking `User-Agent` strings for a variety of web browsers, OSes, devices, etc.

[GitHub][ronin-web-user_agents-github] \| [README][ronin-web-user_agents-readme] \| [Examples][ronin-web-user_agents-examples] \| [Issues][ronin-web-user_agents-issues] \| [Forum][ronin-web-user_agents-forum] \| [Documentation][ronin-web-user_agents-docs]

[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-web-user_agents-github]: https://github.com/ronin-rb/ronin-web-user_agents
[ronin-web-user_agents-readme]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-web-user_agents-examples]: https://github.com/ronin-rb/ronin-web-user_agents#examples
[ronin-web-user_agents-issues]: https://github.com/ronin-rb/ronin-web-user_agents/issues
[ronin-web-user_agents-forum]: https://github.com/ronin-rb/ronin-web-user_agents/discussions
[ronin-web-user_agents-docs]: /docs/ronin-web-user_agents/

### ronin-web

[ronin-web] brings together all of the other `ronin-web-` libraries and provides
the [`ronin-web` command][ronin-web-synopsis] which provides numerous handy
web related commands, such as `diff`, `html`, `reverse-proxy`, `server`, and
`spider`.

[GitHub][ronin-web-github] \| [README][ronin-web-readme] \| [Synopsis][ronin-web-synopsis] \| [Examples][ronin-web-examples] \| [Issues][ronin-web-issues] \| [Forum][ronin-web-forum] \| [Documentation][ronin-web-docs]

[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-web-github]: https://github.com/ronin-rb/ronin-web
[ronin-web-readme]: https://github.com/ronin-rb/ronin-web#readme
[ronin-web-synopsis]: https://github.com/ronin-rb/ronin-web#synopsis
[ronin-web-examples]: https://github.com/ronin-rb/ronin-web#examples
[ronin-web-issues]: https://github.com/ronin-rb/ronin-web/issues
[ronin-web-forum]: https://github.com/ronin-rb/ronin-web/discussions
[ronin-web-docs]: /docs/ronin-web/

### ronin-code-asm

[ronin-code-asm] is a Ruby DSL for writing assembly in pure-Ruby.
[ronin-code-asm] can assemble full program or be used to write shellcode.

[GitHub][ronin-code-asm-github] \| [README][ronin-code-asm-readme] \| [Examples][ronin-code-asm-examples] \| [Issues][ronin-code-asm-issues] \| [Forum][ronin-code-asm-forum] \| [Documentation][ronin-code-asm-docs]

[ronin-code-asm]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-asm-github]: https://github.com/ronin-rb/ronin-code-asm
[ronin-code-asm-readme]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-asm-examples]: https://github.com/ronin-rb/ronin-code-asm#examples
[ronin-code-asm-issues]: https://github.com/ronin-rb/ronin-code-asm/issues
[ronin-code-asm-forum]: https://github.com/ronin-rb/ronin-code-asm/discussions
[ronin-code-asm-docs]: /docs/ronin-code-asm/

### ronin-code-sql

[ronin-code-sql] is a Ruby DSL for crafting SQL injections. It can also generate
obfuscated SQL for bypassing filters.

[GitHub][ronin-code-sql-github] \| [README][ronin-code-sql-readme] \| [Examples][ronin-code-sql-examples] \| [Issues][ronin-code-sql-issues] \| [Forum][ronin-code-sql-forum] \| [Documentation][ronin-code-sql-docs]

[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-code-sql-github]: https://github.com/ronin-rb/ronin-code-sql
[ronin-code-sql-readme]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-code-sql-examples]: https://github.com/ronin-rb/ronin-code-sql#examples
[ronin-code-sql-issues]: https://github.com/ronin-rb/ronin-code-sql/issues
[ronin-code-sql-forum]: https://github.com/ronin-rb/ronin-code-sql/discussions
[ronin-code-sql-docs]: /docs/ronin-code-sql/

### ronin-vulns

[ronin-vulns] is a Ruby library for blind vulnerability testing. It can test for
Local File Inclusion (LFI), Remote File Inclusion (RFI), SQL injection (SQLi),
reflective Cross Site Scripting (XSS), Server Side Template Injection (SSTI),
and Open Redirects.

[GitHub][ronin-vulns-github] \| [README][ronin-vulns-readme] \| [Synopsis][ronin-vulns-synopsis] \| [Examples][ronin-vulns-examples] \| [Issues][ronin-vulns-issues] \| [Forum][ronin-vulns-forum] \| [Documentation][ronin-vulns-docs]

[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-github]: https://github.com/ronin-rb/ronin-vulns
[ronin-vulns-readme]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-synopsis]: https://github.com/ronin-rb/ronin-vulns#synopsis
[ronin-vulns-examples]: https://github.com/ronin-rb/ronin-vulns#examples
[ronin-vulns-issues]: https://github.com/ronin-rb/ronin-vulns/issues
[ronin-vulns-forum]: https://github.com/ronin-rb/ronin-vulns/discussions
[ronin-vulns-docs]: /docs/ronin-vulns/

### ronin-post_ex

[ronin-post_ex] provides a Post-Exploitation API for [interacting with
compromised systems][ronin-post_ex-examples]. [ronin-post_ex] is used by both
[ronin-payloads] and [ronin-exploits].

[GitHub][ronin-post_ex-github] \| [README][ronin-post_ex-readme] \| [Examples][ronin-post_ex-examples] \| [Issues][ronin-post_ex-issues] \| [Forum][ronin-post_ex-forum] \| [Documentation][ronin-post_ex-docs]

[ronin-post_ex]: https://github.com/ronin-rb/ronin-post_ex#readme
[ronin-post_ex-github]: https://github.com/ronin-rb/ronin-post_ex
[ronin-post_ex-readme]: https://github.com/ronin-rb/ronin-post_ex#readme
[ronin-post_ex-examples]: https://github.com/ronin-rb/ronin-post_ex#examples
[ronin-post_ex-issues]: https://github.com/ronin-rb/ronin-post_ex/issues
[ronin-post_ex-forum]: https://github.com/ronin-rb/ronin-post_ex/discussions
[ronin-post_ex-docs]: /docs/ronin-post_ex/

### ronin-payloads

[ronin-payloads] is a Ruby micro-framework for writing exploit payloads as plain
old Ruby classes. [ronin-payloads] comes with common payloads (ex: `exec_shell`,
`bind_shell`, `reverse_shell`) and can also load 3rd party payloads from
[ronin-repos].

[GitHub][ronin-payloads-github] \| [README][ronin-payloads-readme] \| [Synopsis][ronin-payloads-synopsis] \| [Examples][ronin-payloads-examples] \| [Issues][ronin-payloads-issues] \| [Forum][ronin-payloads-forum] \| [Documentation][ronin-payloads-docs]

[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-payloads-github]: https://github.com/ronin-rb/ronin-payloads
[ronin-payloads-readme]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-payloads-synopsis]: https://github.com/ronin-rb/ronin-payloads#synopsis
[ronin-payloads-examples]: https://github.com/ronin-rb/ronin-payloads#examples
[ronin-payloads-issues]: https://github.com/ronin-rb/ronin-payloads/issues
[ronin-payloads-forum]: https://github.com/ronin-rb/ronin-payloads/discussions
[ronin-payloads-docs]: /docs/ronin-payloads/

### ronin-exploits

[ronin-exploits] is a Ruby micro-framework for writing and running exploits.
[ronin-exploits] allows one to write exploits as plain old Ruby classes.
[ronin-exploits] can load and run 3rd party exploits from either Ruby files or
from [ronin-repos].

[GitHub][ronin-exploits-github] \| [README][ronin-exploits-readme] \| [Synopsis][ronin-exploits-synopsis] \| [Examples][ronin-exploits-examples] \| [Issues][ronin-exploits-issues] \| [Forum][ronin-exploits-forum] \| [Documentation][ronin-exploits-docs]

[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-exploits-github]: https://github.com/ronin-rb/ronin-exploits
[ronin-exploits-readme]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-exploits-synopsis]: https://github.com/ronin-rb/ronin-exploits#synopsis
[ronin-exploits-examples]: https://github.com/ronin-rb/ronin-exploits#examples
[ronin-exploits-issues]: https://github.com/ronin-rb/ronin-exploits/issues
[ronin-exploits-forum]: https://github.com/ronin-rb/ronin-exploits/discussions
[ronin-exploits-docs]: /docs/ronin-exploits/

### ronin-fuzzer

[ronin-fuzzer] is a Ruby library and CLI for generating, mutating, and fuzzing
data. The goal of [ronin-fuzzer] is to be as configurable as possible.

[GitHub][ronin-fuzzer-github] \| [README][ronin-fuzzer-readme] \| [Synopsis][ronin-fuzzer-synopsis] \| [Examples][ronin-fuzzer-examples] \| [Issues][ronin-fuzzer-issues] \| [Forum][ronin-fuzzer-forum] \| [Documentation][ronin-fuzzer-docs]

[ronin-fuzzer]: https://github.com/ronin-rb/ronin-fuzzer#readme
[ronin-fuzzer-github]: https://github.com/ronin-rb/ronin-fuzzer
[ronin-fuzzer-readme]: https://github.com/ronin-rb/ronin-fuzzer#readme
[ronin-fuzzer-synopsis]: https://github.com/ronin-rb/ronin-fuzzer#synopsis
[ronin-fuzzer-examples]: https://github.com/ronin-rb/ronin-fuzzer#examples
[ronin-fuzzer-issues]: https://github.com/ronin-rb/ronin-fuzzer/issues
[ronin-fuzzer-forum]: https://github.com/ronin-rb/ronin-fuzzer/discussions
[ronin-fuzzer-docs]: /docs/ronin-fuzzer/

## Beta Testers Wanted!

Please consider testing Ronin 2.0.0 (beta) as any feedback helps improve
the final release. Even just reviewing the `README` files on GitHub or the [API
documentation](/docs/) helps. Nearly a year of non-stop development and 4153
commits have gone into Ronin 2.0.0 (beta) and the other `ronin-` libraries,
but now we need actual users to test drive it.
