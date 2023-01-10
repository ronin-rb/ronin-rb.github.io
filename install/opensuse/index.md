---
layout: default
title: Install - OpenSUSE
---

# Installing Ronin on OpenSUSE

## Copy/Paste Instructions

```shell
sudo gem install ronin --pre
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo zypper -n in -l gcc make
```

{% include install/ruby.md %}

```shell
sudo zypper -n in -l ruby-devel
```

{% include install/c_libraries.md %}

```shell
sudo zypper -n in -l readline-devel sqlite3-devel
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
