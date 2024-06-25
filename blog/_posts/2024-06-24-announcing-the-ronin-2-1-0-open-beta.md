---
layout: post
title: Announcing the Ronin 2.1.0 Open Beta
author: postmodern
tags:
  - beta
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
---

Now that [Phase 2 has been completed][1], and the first `rc` versions have been
released, it is time to begin the Open Beta Testing Phase for Ronin 2.1.0.

[1]: /blog/2024/06/18/phase-2-is-now-done.html

* [What is Ronin?](#what-is-ronin)
* [What's New?](#whats-new)
  * [New Libraries](#new-libraries)
  * [New Commands](#new-commands)
  * [ChangeLogs](#changelogs)
* [How long will the Open Beta last?](#how-long-will-the-open-beta-last)
* [When Will Ronin 2.1.0 finally be released?](#when-will-ronin-210-finally-be-released)
* [How do I participate?](#how-do-i-participate)
  * [How To Install Ronin 2.1.0.rc1](#how-to-install-ronin-210rc1)
  * [How To Report Issues](#how-to-report-issues)
  * [Will there be prizes?](#will-there-be-prizes)

## What is Ronin?

{% include description.md %}

## What's New?

* 22 [new versions](#changelogs)
* 12 [new libraries](#new-libraries)
* 33 [new commands](#new-commands)
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

* [ronin-support-1.1.0.rc1][ronin-support-changelog]
* [ronin-support-web-0.1.0.rc1][ronin-support-web-changelog]
* [ronin-core-0.2.0.rc1][ronin-core-changelog]
* [ronin-db-activerecord-0.2.0.rc1][ronin-db-activerecord-changelog]
* [ronin-db-0.2.0.rc1][ronin-db-changelog]
* [ronin-dns-proxy-0.1.0.rc1][ronin-dns-proxy-changelog]
* [ronin-listener-dns-0.1.0.rc1][ronin-listener-dns-changelog]
* [ronin-listener-http-0.1.0.rc1][ronin-listener-http-changelog]
* [ronin-listener-0.1.0.rc1][ronin-listener-changelog]
* [ronin-repos-0.2.0.rc1][ronin-repos-changelog]
* [ronin-web-browser-0.1.0.rc1][ronin-web-browser-changelog]
* [ronin-web-session_cookie-0.1.0.rc1][ronin-web-session_cookie-changelog]
* [ronin-web-spider-0.2.0.rc1][ronin-web-spider-changelog]
* [ronin-wordlists-0.1.0.rc1][ronin-wordlists-changelog]
* [ronin-vulns-0.2.0.rc1][ronin-vulns-changelog]
* [ronin-payloads-0.2.0.rc1][ronin-payloads-changelog]
* [ronin-exploits-1.1.0.rc1][ronin-exploits-changelog]
* [ronin-nmap-0.1.0.rc1][ronin-nmap-changelog]
* [ronin-masscan-0.1.0.rc1][ronin-masscan-changelog]
* [ronin-recon-0.1.0.rc1][ronin-recon-changelog]
* [ronin-app-0.1.0.rc1][ronin-app-changelog]
* [ronin-2.1.0.rc1][ronin-changelog]

[ronin-support-changelog]: https://github.com/ronin-rb/ronin-support/blob/1.1.0/ChangeLog.md
[ronin-support-web-changelog]: https://github.com/ronin-rb/ronin-support-web/blob/main/ChangeLog.md
[ronin-core-changelog]: https://github.com/ronin-rb/ronin-core/blob/0.2.0/ChangeLog.md
[ronin-db-activerecord-changelog]: https://github.com/ronin-rb/ronin-db-activerecord/blob/0.2.0/ChangeLog.md
[ronin-db-changelog]: https://github.com/ronin-rb/ronin-db/blob/0.2.0/ChangeLog.md
[ronin-dns-proxy-changelog]: https://github.com/ronin-rb/ronin-dns-proxy/blob/main/ChangeLog.md
[ronin-listener-dns-changelog]: https://github.com/ronin-rb/ronin-listener-dns/blob/main/ChangeLog.md
[ronin-listener-http-changelog]: https://github.com/ronin-rb/ronin-listener-http/blob/main/ChangeLog.md
[ronin-listener-changelog]: https://github.com/ronin-rb/ronin-listener/blob/main/ChangeLog.md
[ronin-repos-changelog]: https://github.com/ronin-rb/ronin-repos/blob/0.2.0/ChangeLog.md
[ronin-web-browser-changelog]: https://github.com/ronin-rb/ronin-web-browser/blob/main/ChangeLog.md
[ronin-web-session_cookie-changelog]: https://github.com/ronin-rb/ronin-web-session_cookie/blob/main/ChangeLog.md
[ronin-web-spider-changelog]: https://github.com/ronin-rb/ronin-web-spider/blob/0.2.0/ChangeLog.md
[ronin-wordlists-changelog]: https://github.com/ronin-rb/ronin-wordlists/blob/main/ChangeLog.md
[ronin-vulns-changelog]: https://github.com/ronin-rb/ronin-vulns/blob/0.2.0/ChangeLog.md
[ronin-payloads-changelog]: https://github.com/ronin-rb/ronin-payloads/blob/0.2.0/ChangeLog.md
[ronin-exploits-changelog]: https://github.com/ronin-rb/ronin-exploits/blob/1.1.0/ChangeLog.md
[ronin-nmap-changelog]: https://github.com/ronin-rb/ronin-nmap/blob/main/ChangeLog.md
[ronin-masscan-changelog]: https://github.com/ronin-rb/ronin-masscan/blob/main/ChangeLog.md
[ronin-recon-changelog]: https://github.com/ronin-rb/ronin-recon/blob/main/ChangeLog.md
[ronin-app-changelog]: https://github.com/ronin-rb/ronin-app/blob/main/ChangeLog.md
[ronin-changelog]: https://github.com/ronin-rb/ronin/blob/2.1.0/ChangeLog.md

## How long will the Open Beta last?

**Now** until **July 19th, 2024** (~4 weeks).

## When Will Ronin 2.1.0 finally be released?

**July 22nd, 2024**

## How do I participate?

* [Install ronin-2.1.0.rc1](#how-to-install-ronin-210rc1)
* Test the [new commands](#new-commands).
* Test the [new libraries](#new-libraries).
* Review all new documentation and man-pages for typos or spelling mistakes.
* [Submit bug reports](#how-to-report-issues) or Pull Requests.

### How To Install Ronin 2.1.0.rc1

Ronin 2.1.0.rc1 and all of the other dependencies can be installed using the
new [ronin-install.sh] installation script with the `--pre` option flag.
Simply copy and paste the follow two commands into your terminal to download
and execute the installation script:

{% include install_script_pre.md %}

[ronin-install.sh]: https://github.com/ronin-rb/scripts#readme

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
the [ronin-install.sh] script will automatically install any
required external dependencies (ex: `ruby`, `libsqlite3`, etc) if they are not
already installed.
  </div>
</article>

If you prefer using [Docker], there are also `roninrb/ronin:2.1.0.rc1`
[Docker images] available for Ubuntu, Fedora, and Alpine, that beta testers can
also pull down and run:

```shell
$ docker pull roninrb/ronin:2.1.0.rc1
$ docker run --rm -it roninrb/ronin:2.1.0.rc1
root@ad24537b200e:/# ronin -V
ronin 2.1.0.rc1
```

[Docker]: https://www.docker.com/
[Docker images]: https://hub.docker.com/r/roninrb/ronin/tags

### How To Report Issues

Bugs or other issues should be reported to the relevant
[GitHub repository][ronin-rb]'s issue tracker. Additionally, questions can be
posted in the GitHub repository's forum (called "Discussions").

Finally, if you'd like to chat, we have a [Discord server] which beta testers
can join.

[Discord server]: {{ site.discord_link }}

## Will there be prizes?

Beta tests that successfully submit a bug report or a Pull Request are eligible
for a [free sticker][stickers].

[stickers]: https://roninrb.bigcartel.com/category/stickers

[ronin-rb]: https://github.com/ronin-rb

[ronin-support]: https://github.com/ronin-rb/ronin-support/tree/1.1.0#readme
[ronin-support-web]: https://github.com/ronin-rb/ronin-support-web/tree/main#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core/tree/0.2.0#readme
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord/tree/0.2.0#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db/tree/0.2.0#readme
[ronin-dns-proxy]: https://github.com/ronin-rb/ronin-dns-proxy/tree/main#readme
[ronin-listener-dns]: https://github.com/ronin-rb/ronin-listener-dns/tree/main#readme
[ronin-listener-http]: https://github.com/ronin-rb/ronin-listener-http/tree/main#readme
[ronin-listener]: https://github.com/ronin-rb/ronin-listener/tree/main#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos/tree/0.2.0#readme
[ronin-web-browser]: https://github.com/ronin-rb/ronin-web-browser/tree/main#readme
[ronin-web-session_cookie]: https://github.com/ronin-rb/ronin-web-session_cookie/tree/main#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider/tree/0.2.0#readme
[ronin-wordlists]: https://github.com/ronin-rb/ronin-wordlists/tree/main#readme
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns/tree/0.2.0#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads/tree/0.2.0#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits/tree/1.1.0#readme
[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap/tree/main#readme
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan/tree/main#readme
[ronin-recon]: https://github.com/ronin-rb/ronin-recon/tree/main#readme
[ronin-app]: https://github.com/ronin-rb/ronin-app/tree/main#readme
[ronin]: https://github.com/ronin-rb/ronin/tree/2.1.0#readme
