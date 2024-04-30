---
layout: post
author: postmodern
title: Yes, you can install Ronin on FreeBSD
tags:
  - install
  - freebsd
---

Recently we fixed a few dependency issues in the [automatic installation
script][install] and [manual instructions][install-freebsd] for [FreeBSD].

Now installing [Ronin] on FreeBSD is as easy as:

{% include install_script.md %}

Or if you prefer to install [Ronin] manually:

```shell
sudo pkg install -y gcc make devel/pkgconf ruby deve/ruby-gems
sudo gem install ronin
```

[Ronin]: /
[install]: /install/#bash-script
[install-freebsd]: /install/freebsd/
[FreeBSD]: https://www.freebsd.org/
