---
layout: post
title: ronin-support 1.0.7 and 1.1.0.rc2, ronin-web-spider 0.2.0.rc3, and ronin-recon 0.1.0.rc2 released
author: postmodern
tags:
  - ronin-support
  - ronin-web-spider
  - ronin-recon
  - release
  - beta
---

[ronin-support][ronin-support] [1.0.7][ronin-support-1.0.7] and
[1.1.0.rc2][ronin-support-1.1.0.rc2] have been released. The [ronin-support]
releases fixed parsing of Unicode surrogate character pairs in JavaScript
strings (ex: `"\uD83D\uDE80"`) in [Ronin::Support::Encoding::JS.unescape] and
[String#js_unescape]. This bug was discovered while beta testing [ronin-recon],
Ronin's new recon engine. [ronin-support 1.0.7][ronin-support-1.0.7] also
improves the performance of [Ronin::Support::Encoding::JS.unescape] and
[String#js_unescape] by 2x!

[ronin-web-spider][ronin-web-spider] [0.2.0.rc3][ronin-web-spider-0.2.0.rc3] was
also released fixing issues with the new `each_javascript_string` method which
extracts JavaScript string literals while spidering a website.

[ronin-recon][ronin-recon] [0.1.0.rc2][ronin-recon-0.1.0.rc2] was also released
with numerous bug fixes that were discovered during testing.

**Reminder:** there are only **four days** remaining in the
[Ronin 2.1.0 Open Beta] testing period. Keep testing!

## How To Update

### Gems

To only update [ronin-support] to [1.0.7][ronin-support-1.0.7], simply run:

```shell
gem update ronin-support
```

If you are participating in the [Ronin 2.1.0 Open Beta], you can update to
[ronin-support][ronin-support] [1.1.0.rc2][ronin-support-1.1.0.rc2],
[ronin-web-spider][ronin-web-spider] [0.2.0.rc3][ronin-web-spider-0.2.0.rc3],
and [ronin-recon][ronin-recon] [0.1.0.rc2][ronin-recon-0.1.0.rc2] by running:

```shell
gem update ronin-support ronin-web-spider ronin-recon --pre
```

### Docker

{% include docker_update.md %}

If you are participating in the [Ronin 2.1.0 Open Beta], you can pull down the
updated `roninrb/ronin:2.1.0.rc1.3` docker image:

```shell
$ docker pull roninrb/ronin:2.1.0.rc1.3
```

### Snap

{% include snap_update.md %}

[Ronin 2.1.0 Open Beta]: /blog/2024/06/24/announcing-the-ronin-2-1-0-open-beta.html

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-1.0.7]: https://github.com/ronin-rb/ronin-support/releases/tag/v1.0.7
[ronin-support-1.1.0.rc2]: https://github.com/ronin-rb/ronin-support/compare/v1.1.0.rc1...v1.1.0.rc2

[Ronin::Support::Encoding::JS.unescape]: https://ronin-rb.dev/docs/ronin-support/Ronin/Support/Encoding/JS.html#unescape-class_method
[String#js_unescape]: https://ronin-rb.dev/docs/ronin-support/String.html#js_unescape-instance_method

[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-spider-0.2.0.rc3]: https://github.com/ronin-rb/ronin-web-spider/compare/v0.2.0.rc2...v0.2.0.rc3

[ronin-recon]: https://github.com/ronin-rb/ronin-recon#readme
[ronin-recon-0.1.0.rc2]: https://github.com/ronin-rb/ronin-recon/compare/v0.1.0.rc1...v0.1.0.rc2
