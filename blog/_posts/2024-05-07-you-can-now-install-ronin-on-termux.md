---
layout: post
title: You can now install Ronin on Termux
author: postmodern
tags:
  - install
  - termux
  - android
---

You can now [install] [Ronin] on [Termux]!.

<figure>
  <img alt="Proof of ronin being installed in Termux" src="you-can-now-install-ronin-on-termux/screenshot.png" />
</figure>

We have updated the [automatic installation script][install] to support
detecting and installing on [Termux], and have added
[manual instructions][install-termux] as well.

Now installing [Ronin] on [Termux] is as easy as:

{% include install_script.md %}

Or if you prefer to install [Ronin] manually:

```shell
pkg install -y binutils clang make ruby libxml2 libxslt git zip
gem install nokogiri --platform ruby -- --use-system-libraries
gem install ronin
```

[Ronin]: /
[install]: /install/
[install-termux]: /install/termux/
[Termux]: https://termux.dev/en/
