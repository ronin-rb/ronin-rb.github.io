---
layout: default
title: Install - Fedora
---

# Installing Ronin on Fedora

## Copy/Paste Instructions

```shell
sudo dnf install -y gcc make ruby-devel readline-devel sqlite-devel libxml2-devel libxslt-devel
sudo gem install ronin --pre
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo dnf install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo apt install -y ruby-devel
```

{% include install/c_libraries.md %}

```shell
sudo dnf install -y readline-devel sqlite-devel libxml2-devel libxslt-devel
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}