---
layout: post
title: Ronin 2.1.1 and more released!
author: postmodern
tags:
  - ronin-support
  - ronin-support-web
  - ronin-core
  - ronin-web-server
  - ronin-web-spider
  - ronin-web-session_cookie
  - ronin-web-user_agents
  - ronin-web
  - ronin-vulns
  - ronin-payloads
  - ronin-exploits
  - ronin-db-activerecord
  - ronin-db
  - ronin-code-asm
  - ronin-code-sql
  - ronin-nmap
  - ronin-masscan
  - ronin
---

[Ronin][ronin] [2.1.1][ronin-2.1.1],
[ronin-support][ronin-support] [1.1.1][ronin-support-1.1.1],
[ronin-support-web][ronin-support-web] [0.1.1][ronin-support-web-0.1.1],
[ronin-core][ronin-core] [0.2.1][ronin-core-0.2.1],
[ronin-web-server][ronin-web-server] [0.1.2][ronin-web-server-0.1.2],
[ronin-web-spider][ronin-web-spider] [0.2.1][ronin-web-spider-0.2.1],
[ronin-web-session_cookie][ronin-web-session_cookie] [0.1.1][ronin-web-session_cookie-0.1.1],
[ronin-web-user_agents][ronin-web-user_agents] [0.1.1][ronin-web-user_agents-0.1.1],
[ronin-web][ronin-web] [2.0.1][ronin-web-2.0.1],
[ronin-vulns][ronin-vulns] [0.2.1][ronin-vulns-0.2.1],
[ronin-payloads][ronin-payloads] [0.2.1][ronin-payloads-0.2.1],
[ronin-exploits][ronin-exploits] [1.1.1][ronin-exploits-1.1.1],
[ronin-db-activerecord][ronin-db-activerecord] [0.2.1][ronin-db-activerecord-0.2.1],
[ronin-db][ronin-db] [0.2.1][ronin-db-0.2.1],
[ronin-code-asm][ronin-code-asm] [1.0.1][ronin-code-asm-1.0.1],
[ronin-code-sql][ronin-code-sql] [2.1.1][ronin-code-sql-2.1.1],
[ronin-nmap][ronin-nmap] [0.1.1][ronin-nmap-0.1.1], and
[ronin-masscan][ronin-masscan] [0.1.1][ronin-masscan-0.1.1] were released.

These new patch releases primarily contain new dependencies on the [base64]
and [csv] stdlib gems for Bundler and Ruby 3.4.0, switched to use of
`require_relative` to improve load times, and other minor documentation fixes.
Other notable changes include fixing multiple bugs in the
[`ronin-payloads encode`][ronin-payloads-encode] command, minor corrections to
the [`ronin-exploits new`][ronin-exploits-new] command, improvements to
escaping/unescaping of shell strings, and improvements to version string
detection.

{% include update_ronin.md %}

{% include docker_update.md %}

[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-2.1.1]: https://github.com/ronin-rb/ronin/releases/tag/v2.1.1
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-1.1.1]: https://github.com/ronin-rb/ronin-support/releases/tag/v1.1.1
[ronin-support-web]: https://github.com/ronin-rb/ronin-support-web#readme
[ronin-support-web-0.1.1]: https://github.com/ronin-rb/ronin-support-web/releases/tag/v0.1.1
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-core-0.2.1]: https://github.com/ronin-rb/ronin-core/releases/tag/v0.2.1
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-server-0.1.2]: https://github.com/ronin-rb/ronin-web-server/releases/tag/v0.1.2
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-spider-0.2.1]: https://github.com/ronin-rb/ronin-web-spider/releases/tag/v0.2.1
[ronin-web-session_cookie]: https://github.com/ronin-rb/ronin-web-session_cookie#readme
[ronin-web-session_cookie-0.1.1]: https://github.com/ronin-rb/ronin-web-session_cookie/releases/tag/v0.1.1
[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-web-user_agents-0.1.1]: https://github.com/ronin-rb/ronin-web-user_agents/releases/tag/v0.1.1
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-web-2.0.1]: https://github.com/ronin-rb/ronin-web/releases/tag/v2.0.1
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-0.2.1]: https://github.com/ronin-rb/ronin-vulns/releases/tag/v0.2.1
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-payloads-0.2.1]: https://github.com/ronin-rb/ronin-payloads/releases/tag/v0.2.1
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-exploits-1.1.1]: https://github.com/ronin-rb/ronin-exploits/releases/tag/v1.1.1
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord#readme
[ronin-db-activerecord-0.2.1]: https://github.com/ronin-rb/ronin-db-activerecord/releases/tag/v0.2.1
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-0.2.1]: https://github.com/ronin-rb/ronin-db/releases/tag/v0.2.1
[ronin-code-asm]: https://github.com/ronin-rb/ronin-code-asm#readme
[ronin-code-asm-1.0.1]: https://github.com/ronin-rb/ronin-code-asm/releases/tag/v1.0.1
[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[ronin-code-sql-2.1.1]: https://github.com/ronin-rb/ronin-code-sql/releases/tag/v2.1.1
[ronin-nmap]: https://github.com/ronin-rb/ronin-nmap#readme
[ronin-nmap-0.1.1]: https://github.com/ronin-rb/ronin-nmap/releases/tag/v0.1.1
[ronin-masscan]: https://github.com/ronin-rb/ronin-masscan#readme
[ronin-masscan-0.1.1]: https://github.com/ronin-rb/ronin-masscan/releases/tag/v0.1.1

[ronin-payloads-encode]: /docs/man/ronin-payloads-encode.1.html
[ronin-exploits-new]: /docs/man/ronin-exploits-new.1.html

[base64]: https://github.com/ruby/base64#readme
[csv]: https://github.com/ruby/csv#readme
