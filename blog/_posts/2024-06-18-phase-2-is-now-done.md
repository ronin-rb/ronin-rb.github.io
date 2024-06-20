---
layout: post
author: postmodern
title: Phase 2 is now DONE!
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
---

After one year and two months of development, 1839 commits and 411 closed
issues later, [Phase 2] is *finally* done!

This is the culmination of three years of hard work to get Ronin back on track.
Phase 2 was [announced] on 2023-04-16 following the completion of
[The Big Refactor], with the goal of building out additional larger features
for Ronin. Phase 2 resulted in many new projects, such as:

* [ronin-support-web] - A web specific support library, providing many helper
  methods for parsing HTML/XML, fetching web pages, etc. Think of it like a
  light-weight headless web browser without JavaScript.
* [ronin-dns-proxy] - A configurable DNS proxy server library, supports
  returning spoofing DNS results or passing DNS queries through to the upstream
  DNS nameserver.
* [ronin-listener-dns] - A DNS server for receiving exfiltrated data sent via
  DNS queries, which can be used to test for XML external entity (XXE)
  injection.
* [ronin-listener-http] - A HTTP server for receiving exfiltrated data sent via
  HTTP requests, which can be used to test for Server-Side Request
  Forgery (SSRF) or XML external entity (XXE) injection.
* [ronin-listener] - a small CLI utility for receiving exfiltrated data over DNS
  or HTTP.
* [ronin-nmap] - A Ruby library for working with [nmap]. [ronin-nmap] can parse
  nmap XML, convert nmap XML into JSON or CSV, or import nmap XML into the
  [ronin-db] database.
* [ronin-masscan] - A Ruby library for working with [masscan]. [ronin-masscan]
  can parse masscan scan files, convert masscan files into JSON or CSV, or
  import masscan scan data into the [ronin-db] database.
* [ronin-recon] - A micro-framework and tool for performing reconnaissance.
  [ronin-recon] uses multiple workers which process different data types
  (IP, host, URL, etc) and produce new values. [ronin-recon] contains built-in
  recon workers and supports loading additional 3rd-party workers from Ruby
  files or 3rd-party git repositories. [ronin-recon] has a unique queue design
  and uses asynchronous I/O to maximize efficiency. [ronin-recon] can lookup
  IPs addresses, nameservers, mailservers, bruteforce sub-domains, port scan
  IPs, discover services, and spider websites.
* [ronin-web-session_cookie] - A library for parsing and deserializing various
  session cookie formats. It supports [Rack], [Django], and [JWT].
* [ronin-web-browser] - A Ruby library for automating the Chrome web browser.
  [ronin-web-browser] builds on the [ferrum] gem, and adds additional API
  methods that are useful to security researchers.
* [ronin-wordlists] - A library and tool for managing wordlists.
  [ronin-wordlists] can install and update wordlists, and contains a curated
  list of popular wordlists and their download URLs.
* [ronin-app] - A small web application that is meant to be ran locally by the
  user. It provides a web interface to [ronin-support], [ronin-repos],
  [ronin-db], [ronin-payloads], [ronin-exploits], as well as automating
  [ronin-nmap], [ronin-masscan], [ronin-web-spider], [ronin-recon], and
  [ronin-vulns].

The next step will be to release release-candidate versions and announce a call
for beta testers.

Also, big shout out to our new core-team member, [AI-Mozi], who helped out with
writing tests, fixing bugs, and implementing many of [ronin-app]'s features.

[Phase 2]: https://github.com/orgs/ronin-rb/projects/9/views/1
[announced]: /blog/2023/04/16/announcing-phase-2.html
[The Big Refactor]: /blog/2022/12/30/the-big-refactor-is-done.html

[ronin-support-web]: https://github.com/ronin-rb/ronin-support-web#readme
[ronin-dns-proxy]: https://github.com/ronin-rb/ronin-dns-proxy#readme
[ronin-listener-dns]: https://github.com/ronin-rb/ronin-listener-dns#readme
[ronin-listener-http]: https://github.com/ronin-rb/ronin-listener-http#readme
[ronin-listener]: https://github.com/ronin-rb/ronin-listener#readme
[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap#readme
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan#readme
[ronin-recon]: https://github.com/ronin-rb/ronin-recon#readme
[ronin-web-session_cookie]: https://github.com/ronin-rb/ronin-web-session_cookie#readme
[ronin-web-browser]: https://github.com/ronin-rb/ronin-web-browser#readme
[ronin-wordlists]: https://github.com/ronin-rb/ronin-wordlists#readme
[ronin-app]: https://github.com/ronin-rb/ronin-app#readme

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme

[nmap]: https://nmap.org/
[masscan]: https://github.com/robertdavidgraham/masscan#readme
[Rack]: https://github.com/rack/rack#readme
[Django]: https://www.djangoproject.com/
[JWT]: https://jwt.io/
[ferrum]: https://github.com/rubycdp/ferrum#readme

[AI-Mozi]: https://github.com/AI-Mozi
