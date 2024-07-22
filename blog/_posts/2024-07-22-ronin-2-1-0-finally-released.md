---
layout: post
title: Ronin 2.1.0 finally released!
author: postmodern
tags:
  - ronin
  - ronin-support
  - ronin-support-web
  - ronin-core
  - ronin-repos
  - ronin-db-activerecord
  - ronin-db
  - ronin-web-session_cookie
  - ronin-web-spider
  - ronin-web-browser
  - ronin-web
  - ronin-dns-proxy
  - ronin-listener-dns
  - ronin-listener-http
  - ronin-listener
  - ronin-vulns
  - ronin-payloads
  - ronin-exploits
  - ronin-nmap
  - ronin-masscan
  - ronin-wordlists
  - ronin-recon
  - ronin-app
  - release
---

After nearly a year of development and the [completion of Phase 2],
[Ronin][ronin] [2.1.0][ronin-2.1.0] has *finally* been released! It might not
seem like a big difference between 2.0.0 and 2.1.0, but this release includes
a *ton* of [new libraries and commands](#what-is-new).

[completion of Phase 2]: /blog/2024/06/18/phase-2-is-now-done.html

* [What is Ronin?](#what-is-ronin)
* [What's New?](#whats-new)
  * [New Libraries](#new-libraries)
  * [New Commands](#new-commands)
  * [ChangeLogs](#changelogs)
* [How To Install](#how-to-install)
* [How To Update](#how-to-update)
* [Special Thanks](#special-thanks)

## What is Ronin?

{% include description.md %}

## What is New?

* 22 [new versions](#changelogs)
* 12 [new libraries](#new-libraries)
* 33 [new commands](#new-commands)
* 13 [new payloads][ronin-payloads-changelog]
* New [networking and OSINT database models][ronin-db-activerecord-changelog]
  and [CLI commands][ronin-db-changelog].
* A new [DNS proxy library][ronin-dns-proxy] and command.
* A new [DNS and HTTP exfil listener][ronin-listener].
* A new [automated browser library][ronin-web-browser] and command.
* A new [wordlist management library and CLI][ronin-wordlists].
* A new [nmap library and CLI][ronin-nmap].
* A new [masscan library and CLI][ronin-nmap].
* A new [recon engine][ronin-recon].
* A new [local Web UI][ronin-app].
* Shell completion rules for *all* `ronin` and `ronin-*` commands.
* Online [man pages](/docs/man/).

### New Libraries

* [ronin-support-web] - A new web specific support library for ronin-rb.
  Provides many helper methods for parsing HTML/XML, fetching web pages, and
  WebSockets.
* [ronin-web-session_cookie] - A new library for parsing and deserializing
  various session cookie formats. It supports Rack, Django, and JWT.
* [ronin-web-browser] - A new Ruby library for automating the Chrome web
  browser. ronin-web-browser builds on the [ferrum] gem, and adds additional API
  methods that are useful to security researchers. Supports intercepting
  requests and responses, accessing cookies, taking screenshots, etc.
* [ronin-dns-proxy] - A new configurable DNS proxy server library. It supports
  returning spoofing DNS results or passing DNS queries through to the upstream
  DNS nameserver.
* [ronin-listener-dns] - A new DNS server for receiving exfiltrated data sent
  via DNS queries. ronin-listener-dns can be used to test for XML external
  entity (XXE) injection.
* [ronin-listener-http] - A new HTTP server for receiving exfiltrated data sent
  via HTTP requests. ronin-listener-http can be used to test for Server-Side
  Request Forgery (SSRF) or XML external entity (XXE) injection.
* [ronin-listener] - A new small CLI utility for receiving exfiltrated data over
  DNS or HTTP. Supports saving DNS queries and HTTP requests as TXT, CVS, JSON,
  or NDJSON.
* [ronin-nmap] - A new Ruby library and CLI for working with nmap. ronin-nmap
  can parse nmap XML, convert nmap XML into JSON or CSV, or import nmap XML into
  the [ronin-db] database.
* [ronin-masscan] - A new Ruby library and CLI for working with masscan.
  ronin-masscan can parse masscan scan files, convert masscan files into JSON or
  CSV, or import masscan scan data into the ronin-db database.
* [ronin-wordlists] - A new library and tool for managing wordlists.
  ronin-wordlists can install and update wordlists, and contains a curated list
  of popular wordlists and their download URLs.
* [ronin-recon] - A new micro-framework and tool for performing reconnaissance.
  ronin-recon uses multiple workers which process different data types
  (IP, host, URL, etc) and produce new values. ronin-recon contains built-in
  recon workers and supports loading additional 3rd-party workers from Ruby
  files or 3rd-party git repositories. ronin-recon has a unique queue design
  and uses asynchronous I/O to maximize efficiency. ronin-recon can lookup
  IPs addresses, nameservers, mailservers, bruteforce sub-domains, port scan
  IPs, discover services, and spider websites.
* [ronin-app] - A new small web application that is meant to be ran locally by
  the user. It provides a web interface to [ronin-support], [ronin-repos],
  [ronin-db], [ronin-payloads], [ronin-exploits], as well as automating
  [ronin-nmap], [ronin-masscan], [ronin-web-spider], [ronin-recon], and
  [ronin-vulns].

[ferrum]: https://github.com/rubycdp/ferrum#readme

### New Commands

* `ronin archive` - A new command that easily creates `.tar` or `.zip`
  archives.
* `ronin unarchive` - A new command that easily extracts files from `.tar` or
  `.zip` archives.
* `ronin bitsquat` - A new command that checks for available or registered
  bit-squatted domains.
* `ronin completion` - Installs shell completion files
  for *all* `ronin` and `ronin-*` commands for Bash and Zsh shells.
* `ronin dns-proxy` - A new command that starts a DNS proxy that can intercept
  DNS queries and forward others to upstream DNS nameservers.
* `ronin new dns-proxy` - A new code generator command that generates a new
  [ronin-dns-proxy] Ruby script.
* `ronin pack` - A new command that packs the list of arguments into binary data
  based on their C type.
* `ronin unpack` - A new command that unpacks binary data into values for the
  given C types.
* `ronin new exploit` - Alias to `ronin-exploits new`.
* `ronin new payload` - Alias to `ronin-payloads new`.
* `ronin new dns-listener` - Alias to `ronin-listener new dns`.
* `ronin new http-listener` - Alias to `ronin-listener new http`.
* `ronin new web-app` - Alias to `ronin-web new app`.
* `ronin new nokogiri` - Alias to `ronin-web new nokogiri`.
* `ronin new web-server` - Alias to `ronin-web new server`.
* `ronin new web-spider` - Alias to `ronin-web new spider`.
* `ronin-app` - New command that starts the `ronin-app` and starts a web
  browser.
* `ronin-exploits completion` - New command to install shell completion
  files for all `ronin-exploits` commands for Bash and Zsh shells.
* `ronin-payloads completion` - New command to install shell completion
  files for all `ronin-payloads` commands for Bash and Zsh shells.
* `ronin-vulns command-injection` - New command that scans URL(s) for
  Command Injection vulnerabilities.
* `ronin-vulns irb` - New command starts an interactive Ruby shell with
  `ronin/vulns` loaded.
* `ronin-vulns completion` - New command to install shell completion files
  for all `ronin-vulns` commands for Bash and Zsh shells.
* `ronin-listener` - New command suite that allows quickly starting a DNS or
  HTTP server for receiving exfiltrated data.
* `ronin-wordlists` - New command suite that manages wordlists.
* `ronin-recon` - New command suite for performing recon.
* `ronin-web xml` - New command that performs XPath queries on a URL or XML
  file.
* `ronin-web session-cookie` - New command that parses and deserializes various
  session cookie formats.
* `ronin-web user-agent` - New command that generates a random HTTP `User-Agent`
  string.
* `ronin-web wordlist` - New command that spiders a website and builds a
  wordlist.
* `ronin-web browser` - New command that starts an automated web browser.
* `ronin-web screenshot` - New command that screenshots one or more URLs.
* `ronin-web vulns` - New command that spiders a website and tests every URL for
  web vulnerabilities.
* `ronin-web completion` - A new command to install shell completion files
  for all `ronin-web` commands for Bash and Zsh shells.

### ChangeLogs

* [ronin-support-1.1.0][ronin-support-changelog]
* [ronin-support-web-0.1.0][ronin-support-web-changelog]
* [ronin-core-0.2.0][ronin-core-changelog]
* [ronin-db-activerecord-0.2.0][ronin-db-activerecord-changelog]
* [ronin-db-0.2.0][ronin-db-changelog]
* [ronin-dns-proxy-0.1.0][ronin-dns-proxy-changelog]
* [ronin-listener-dns-0.1.0][ronin-listener-dns-changelog]
* [ronin-listener-http-0.1.0][ronin-listener-http-changelog]
* [ronin-listener-0.1.0][ronin-listener-changelog]
* [ronin-repos-0.2.0][ronin-repos-changelog]
* [ronin-web-browser-0.1.0][ronin-web-browser-changelog]
* [ronin-web-session_cookie-0.1.0][ronin-web-session_cookie-changelog]
* [ronin-web-spider-0.2.0][ronin-web-spider-changelog]
* [ronin-web-2.0.0][ronin-web-changelog]
* [ronin-wordlists-0.1.0][ronin-wordlists-changelog]
* [ronin-vulns-0.2.0][ronin-vulns-changelog]
* [ronin-payloads-0.2.0][ronin-payloads-changelog]
* [ronin-exploits-1.1.0][ronin-exploits-changelog]
* [ronin-nmap-0.1.0][ronin-nmap-changelog]
* [ronin-masscan-0.1.0][ronin-masscan-changelog]
* [ronin-recon-0.1.0][ronin-recon-changelog]
* [ronin-fuzzer-0.2.0][ronin-fuzzer-changelog]
* [ronin-app-0.1.0][ronin-app-changelog]
* [ronin-2.1.0][ronin-changelog]

[ronin-support-changelog]: /docs/ronin-support/file.ChangeLog.html#1-1-0-2024-07-22
[ronin-support-web-changelog]: /docs/ronin-support-web/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-core-changelog]: /docs/ronin-core/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-db-activerecord-changelog]: /docs/ronin-db-activerecord/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-db-changelog]: /docs/ronin-db/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-dns-proxy-changelog]: /docs/ronin-dns-proxy/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-listener-dns-changelog]: /docs/ronin-listener-dns/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-listener-http-changelog]: /docs/ronin-listener-http/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-listener-changelog]: /docs/ronin-listener/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-repos-changelog]: /docs/ronin-repos/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-web-browser-changelog]: /docs/ronin-web-browser/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-web-session_cookie-changelog]: /docs/ronin-web-session_cookie/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-web-spider-changelog]: /docs/ronin-web-spider/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-web-changelog]: /docs/ronin-web/file.ChangeLog.html#2-0-0-2024-07-22
[ronin-wordlists-changelog]: /docs/ronin-wordlists/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-vulns-changelog]: /docs/ronin-vulns/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-payloads-changelog]: /docs/ronin-payloads/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-exploits-changelog]: /docs/ronin-exploits/file.ChangeLog.html#1-1-0-2024-07-22
[ronin-nmap-changelog]: /docs/ronin-nmap/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-masscan-changelog]: /docs/ronin-masscan/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-recon-changelog]: /docs/ronin-recon/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-fuzzer-changelog]: /docs/ronin-fuzzer/file.ChangeLog.html#0-2-0-2024-07-22
[ronin-app-changelog]: /docs/ronin-app/file.ChangeLog.html#0-1-0-2024-07-22
[ronin-changelog]: /docs/ronin/file.ChangeLog.html#2-1-0-2024-07-22

## How To Install

[Ronin][ronin] can be installed via the [`ronin-install.sh`][ronin-install.sh]
installer bash script:

{% include install_script.md %}

[ronin-install.sh]: https://github.com/ronin-rb/scripts#ronin-installsh

### Manual

We also have [manual installation instructions] on how to install Ronin on
various platforms.

[manual installation instructions]: /install/

### Docker

[Ronin][ronin] also has [docker images][dockerhub], if you prefer using [docker].

{% include docker_install.md %}

[docker]: https://www.docker.com/
[dockerhub]: https://hub.docker.com/r/roninrb/ronin

## How To Update

### Gems

To update [ronin] and all other gem dependencies, simply run:

```shell
gem update ronin
```

### Docker

{% include docker_update.md %}

### Snap

Unfortunately, the snap images have not yet been updated for Ronin 2.1.0. This
is because the snap images use the `core22` base image, which is based off of
Ubuntu 22.04 LTS and only provides Ruby 3.0.x. Ronin 2.1.0 now requires Ruby
\>= 3.1.0 which makes it incompatible with `core22`. I am currently working on
[upgrading the snap images] to `core24`, which is based off of Ubuntu 24.04 and
does provide Ruby 3.1.x.

[upgrading the snap images]: https://github.com/ronin-rb/snap/issues/8

## Special Thanks

Special thanks to our newest core-team member, [AI-Mozi], who wrote many of the
tests for the newer libraries and some of the features in [ronin-app].

[ronin-rb]: https://github.com/ronin-rb

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-web]: https://github.com/ronin-rb/ronin-support-web#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-dns-proxy]: https://github.com/ronin-rb/ronin-dns-proxy#readme
[ronin-listener-dns]: https://github.com/ronin-rb/ronin-listener-dns#readme
[ronin-listener-http]: https://github.com/ronin-rb/ronin-listener-http#readme
[ronin-listener]: https://github.com/ronin-rb/ronin-listener#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-web-browser]: https://github.com/ronin-rb/ronin-web-browser#readme
[ronin-web-session_cookie]: https://github.com/ronin-rb/ronin-web-session_cookie#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-wordlists]: https://github.com/ronin-rb/ronin-wordlists#readme
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap#readme
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan#readme
[ronin-recon]: https://github.com/ronin-rb/ronin-recon#readme
[ronin-app]: https://github.com/ronin-rb/ronin-app#readme
[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-2.1.0]: https://github.com/ronin-rb/ronin/releases/tag/v2.1.0

[AI-Mozi]: https://github.com/AI-Mozi
