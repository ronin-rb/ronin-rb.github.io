---
layout: post
title: Ronin is now on Open Collective!
author: postmodern
tags:
 - opencollective
 - donations
 - sponsor
---

Ronin is now accepting donations on [Open Collective]! If you want to support
Ronin, consider financially supporting the project so that we can continue
building high-quality Open Source security tools and libraries in Ruby.

* [Become a backer for as low as 5USD per-month][backer]
* [Become a sponsor starting at 100USD per-month][sponsor]
* [Make a one-time donation for as low as 5USD][donate]

## What is Ronin?

[Ronin][ronin] is a free and Open Source [Ruby] toolkit for security research and development. Ronin contains many different [CLI commands][ronin-synopsis] and [Ruby libraries][ronin-rb] for a variety of security tasks, such as encoding/decoding data, filter IPs/hosts/URLs, querying ASNs, querying DNS, HTTP, [scanning for web vulnerabilities][ronin-vulns-synopsis], [spidering websites][ronin-web-spider],
[install 3rd party repositories][ronin-repos-synopsis] of [exploits][ronin-exploits] and/or [payloads][ronin-payloads], [run exploits][ronin-exploits-synopsis], [write new exploits][ronin-exploits-examples], [managing local databases][ronin-db-synopsis], [fuzzing data][ronin-fuzzer], and much more.

[Ruby]: https://www.ruby-lang.org/
[website]: https://ronin-rb.dev/
[ronin-rb]: https://github.com/ronin-rb/
[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-synopsis]: https://github.com/ronin-rb/ronin#synopsis
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-repos-synopsis]: https://github.com/ronin-rb/ronin-repos#synopsis
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-synopsis]: https://github.com/ronin-rb/ronin-db#synopsis
[ronin-fuzzer]: https://github.com/ronin-rb/ronin-fuzzer#readme
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-code-asm]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-exploits-synopsis]: https://github.com/ronin-rb/ronin-exploits#synopsis
[ronin-exploits-examples]: https://github.com/ronin-rb/ronin-exploits#examples
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-synopsis]: https://github.com/ronin-rb/ronin-vulns#synopsis

## How is Ronin different from other security projects?

1. **High Quality:** We take code quality **very** serious. All Ronin libraries have a test coverage of >90% and a documentation coverage of >80%. Additionally, Ronin libraries also have a very small memory footprint, making them ideal for constrained environments.
2. **Ruby Supercharged:** Ronin builds on top of Ruby and adds even more libraries, classes, and methods to make Ruby even easier to use and more powerful!
3. **Fully Scriptable:** Ronin is made up of different Ruby libraries and powerful APIs, all fully documentated, that you can use in Ruby scripts or in the Ruby console.
4. **Powerful CLI:** Ronin provides **many** powerful CLI commands for performing various tasks. You don't have to know Ruby to be able to use Ronin.
5. **Modular Design:** Ronin has a modular architecture, so if you just want to use one part of Ronin, you can simply install that one library.
6. **Distributed:** Ronin supports installing [3rd party git repositories][ronin-repos] of exploits, payloads, or other modules.

## Why is supporting Ronin important?

Supporting the Ronin project financially helps us continue to improve the existing tools and libraries, as well as develop new tools and libraries.

## What are some new projects you have planned?

* `ronin-wordlists` - a tool for managing and downloading wordlists.
* [ronin-nmap] (WIP) - a tool for automating nmap, and querying or importing nmap XML into [ronin-db].
* [ronin-masscan] (WIP) - a tool for automating masscan, and querying or importing masscan output files into [ronin-db].
* [ronin-recon] (WIP) - a modular recursive recon engine.
* `ronin-scanner` - a modular scanner engine that can be hooked up to `ronin-recon`.
* [ronin-app] (WIP) - a local Web App for automated recon, scanning, and exploring the [ronin-db].
* Ronin Manual - a Git Book that covers all of the various ronin libraries and CLI tools.

[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap#readme
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan#readme
[ronin-recon]: https://github.com/ronin-rb/ronin-recon#readme
[ronin-app]: https://github.com/ronin-rb/ronin-app#readme

[Open Collective]: https://opencollective.com/ronin-rb
[backer]: https://opencollective.com/ronin-rb/contribute/backer-50823/checkout?interval=month&amount=5&contributeAs=postmodern
[sponsor]: https://opencollective.com/ronin-rb/contribute/sponsor-50824/checkout
[donate]: https://opencollective.com/ronin-rb/donate?interval=oneTime&amount=20&contributeAs=postmodern
