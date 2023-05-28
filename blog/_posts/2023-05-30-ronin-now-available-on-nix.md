---
layout: post
author: postmodern
title: Ronin now available on Nix!
tags:
  - nixos
---

Thanks to one of our contributors, [@Ch1keen], Ronin is now available on
[Nix]!

## What is Nix?

[Nix] is a cross-platform package manager which helps you install sets of
packages into self-contained directories, instead of globally. Nix can be
installed on macOS and Linux, along side the system's package manager.

## Install

Nix users can install Ronin globally with:

```shell
nix-env -iA nixpkgs.ronin
```

If you instead want to use `ronin` in a virtual environment temporarily:

```shell
nix-shell -p ronin
```

See the [Ronin Nix installation instructions](/install/nix/) for detailed
instructions.

[@Ch1keen]: https://github.com/Ch1keen
[Nix]: https://nixos.org/
