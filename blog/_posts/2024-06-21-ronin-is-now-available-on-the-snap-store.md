---
layout: post
title: Ronin is now available on the Snap store!
author: postmodern
tags:
  - install
  - snap
  - snapcraft
---

Ronin is now available on the [Snap store]! [Snap] is an app store for Linux
that lets you install full self-contained app images onto any Linux distro.

To install Ronin via `snap`, first ensure that [snapd] is installed and running,
then run:

```shell
sudo snap install ronin
```

Now the `ronin` and `ronin-*` commands should be available.

```shell
ronin help
```

This provides yet another way to install Ronin, in addition to the
[bash installer script], [Docker images], and [manual installation
instructions].

[Snap store]: https://snapcraft.io/ronin
[Snap]: https://snapcraft.io/
[snapd]: https://snapcraft.io/snapd

[bash installer script]: /install#bash-script
[manual installation instructions]: /install#manual-instructions
[Docker images]: /install#docker
