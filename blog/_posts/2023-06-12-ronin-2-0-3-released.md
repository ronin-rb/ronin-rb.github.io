---
layout: post
title: ronin-payloads 0.1.3, ronin-exploits 1.0.2, and ronin 2.0.3 released
author: postmodern
tags:
  - ronin
  - ronin-payloads
  - ronin-exploits
---

[ronin-payloads][ronin-payloads] [0.1.3][ronin-payloads-0.1.3],
[ronin-exploits][ronin-exploits] [1.0.2][ronin-exploits-1.0.2],
[ronin][ronin] [2.0.3][ronin-2.0.3] have been released.
These releases contain a few CLI bug fixes, primarily a fix for a regression
in the `ronin irb` command that caused [ronin-support]'s Mixin methods
(ex: `http_get`) to disappear.

{% include update_ronin.md %}

{% include docker_update.md %}

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme

[ronin-payloads-0.1.3]: https://github.com/ronin-rb/ronin-payloads/releases/tag/v0.1.3
[ronin-exploits-1.0.2]: https://github.com/ronin-rb/ronin-exploits/releases/tag/v1.0.2
[ronin-2.0.3]: https://github.com/ronin-rb/ronin/releases/tag/v2.0.3
