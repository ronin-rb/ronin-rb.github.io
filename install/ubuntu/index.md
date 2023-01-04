---
layout: default
title: Install - Ubuntu
---

# Installing Ronin on Ubuntu

## Copy/Paste Instructions

```shell
sudo apt install -y gcc make ruby-full libreadline-dev libsqlite3-dev libxml2-dev libxslt1-dev
sudo gem install ronin --pre
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo apt install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo apt install -y ruby-full
```

{% include install/c_libraries.md %}

```shell
sudo apt install -y libreadline-dev libsqlite3-dev libxml2-dev libxslt1-dev
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
