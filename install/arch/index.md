---
layout: page
title: Install - Arch
---

# Installing Ronin on Arch

## Copy/Paste Instructions

```shell
sudo pacman -Sy --noconfirm gcc make ruby
sudo gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

```shell
sudo pacman -Sy --noconfirm gcc make
```

{% include install/ruby.md %}

```shell
sudo pacman -Sy --noconfirm ruby
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
