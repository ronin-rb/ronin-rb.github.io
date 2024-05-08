---
layout: page
title: Install - Ubuntu
---

# Installing Ronin on Ubuntu

## Copy/Paste Instructions

```shell
sudo apt install -y gcc make ruby-full git zip
sudo gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

```shell
sudo apt install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo apt install -y ruby-full
```

{% include install/runtime_deps.md %}

```shell
sudo apt install -y git zip
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
