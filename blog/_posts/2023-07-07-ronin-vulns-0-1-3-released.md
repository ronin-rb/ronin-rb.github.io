---
layout: post
title: ronin-vulns 0.1.3 released!
author: postmodern
tags:
  - ronin-vulns
  - ssti
  - sqli
  - xss
---

[ronin-vulns][ronin-vulns] [0.1.3][ronin-vulns-0.1.3] has been released!
This version contains minor bug fixes to the Server-Side Template Injection
(SSTI) and SQL injection (SQLi) classes. Also a special thanks to our latest
contributor, [@quadule], for adding improved detection of reflected XSS
occurring after or *inside of* HTML comments.

## Updating

To update [ronin-vulns], simply run:

```shell
sudo gem update ronin-vulns
```

{% include docker_update.md %}

[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-vulns-0.1.3]: https://github.com/ronin-rb/ronin-vulns/releases/tag/v0.1.3
[@quadule]: https://github.com/quadule
