---
layout: post
title: Announcing Phase 2
author: postmodern
tags:
 - ronin-dns-proxy
 - ronin-web-session_cookie
 - ronin-exfil-dns
 - ronin-exfil-http
 - ronin-exfil
 - ronin-wordlists
 - ronin-nmap
 - ronin-masscan
 - ronin-recon
 - ronin-scanner
 - ronin-c2
 - ronin-app
 - phase-2
---

Now that [The Big Refactor] has been completed and [Ronin 2.0.0] has been
released, it is now time to start focusing on the next big set of new features.
I am calling this next big push "Phase 2"; think of [The Big Refactor] as
"Phase 1".

[The Big Refactor]: /blog/2022/01/29/announcing-the-big-refactor.html
[Ronin 2.0.0]: /blog/2023/02/01/ronin-2-0-0-finally-released.html

## High-Level Plan

* [x] Import data from more external tools into the [ronin-db].
  * [x] `nmap`
  * [x] `masscan`
* [x] Create a modular, recursive, and async recon engine.
  * [ ] Add additional worker classes for port scanning, subdomain enumeration,
        directory enumeration, etc.
* [ ] Create a modular rule-based security scanning engine.
* [ ] Create a protocol agnostic C2.
  * [ ] Initially support TCP, HTTP, and DNS, but should allow supporting *any*
        transport protocol.
  * [ ] Initially support JSON RPC 2.0 as the command message format, but should
        allow supporting *any* C2 command message format.
* [x] Create a local-only web interface for Ronin.
  * [ ] Allow searching and navigating *all* of [ronin-db] and it's many models.
  * [x] Allow performing `nmap` scans and importing the data into the
        [ronin-db].
    * [ ] Map *all* of `nmap`'s options to HTTP form fields.
  * [x] Allow performing `masscan` scans and importing the data into the
        [ronin-db].
    * [ ] Map *all* of `masscan`'s options to HTTP form fields.
  * [x] Allow spidering websites and import every URL into the [ronin-db].
    * [ ] Map *all* of [ronin-web-spider]'s options to HTTP form fields.
  * [ ] Allow performing recon and importing the results into the [ronin-db].

## New Libraries

* [ronin-dns-proxy] (Done) - A configurable DNS proxy server library.
* [ronin-exfil-dns] (Done) - A DNS server for receiving exfiltrated data.
* [ronin-exfil-http] (Done) - A HTTP server for receiving exfiltrated data.
* [ronin-exfil] (Done) - A Ruby CLI utility for receiving exfiltrated data.
* [ronin-web-session_cookie] (Done) - A library for parsing and deserializing
  various session cookies.
* `ronin-wordlists` (WIP) - A tool for managing and downloading wordlists.
* [ronin-nmap] (WIP) - A tool for automating nmap, and querying or importing nmap XML into [ronin-db].
* [ronin-masscan] (WIP) - A tool for automating masscan, and querying or importing masscan output files into [ronin-db].
* [ronin-recon] (WIP) - A modular recursive recon engine.
* `ronin-scanner` (Planned) - A modular scanner engine that can be hooked up to `ronin-recon`.
* `ronin-c2` (Prototyping) - A protocol agnostic C2 server.
* [ronin-app] (WIP) - A local Web App for automated recon, scanning, and exploring the [ronin-db].

If you want to see the complete list of GitHub Issues or see what is currently
being worked on, checkout the [GitHub Project Board][Phase-2]. If any of these
new projects seem interesting to you, consider joining our [Discord] server and
getting involved.

[Phase-2]: https://github.com/orgs/ronin-rb/projects/9
[Discord]: https://discord.gg/6WAb3PsVX9

[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-dns-proxy]: https://github.com/ronin-rb/ronin-dns-proxy#readme
[ronin-exfil-dns]: https://github.com/ronin-rb/ronin-exfil-dns#readme
[ronin-exfil-http]: https://github.com/ronin-rb/ronin-exfil-http#readme
[ronin-exfil]: https://github.com/ronin-rb/ronin-exfil#readme
[ronin-web-session_cookie]: https://github.com/ronin-rb/ronin-web-session_cookie#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap#readme
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan#readme
[ronin-recon]: https://github.com/ronin-rb/ronin-recon#readme
[ronin-app]: https://github.com/ronin-rb/ronin-app#readme
