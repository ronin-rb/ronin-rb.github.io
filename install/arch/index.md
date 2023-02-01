---
layout: page
title: Install - Arch
---

# Installing Ronin on Arch

## Copy/Paste Instructions

```shell
sudo pacman -Sy --noconfirm gcc make community/ruby readline sqlite
sudo gem install ronin
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo pacman -Sy --noconfirm gcc make
```

{% include install/ruby.md %}

```shell
sudo pacman -Sy --noconfirm community/ruby
```

{% include install/c_libraries.md %}

```shell
sudo pacman -Sy --noconfirm readline sqlite
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
