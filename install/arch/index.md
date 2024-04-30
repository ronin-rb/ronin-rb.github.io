---
layout: page
title: Install - Arch
---

# Installing Ronin on Arch

## Copy/Paste Instructions

```shell
sudo pacman -Sy --noconfirm gcc make ruby readline
sudo gem install ronin
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo pacman -Sy --noconfirm gcc make
```

{% include install/ruby.md %}

```shell
sudo pacman -Sy --noconfirm ruby
```

{% include install/c_libraries.md %}

```shell
sudo pacman -Sy --noconfirm readline
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
