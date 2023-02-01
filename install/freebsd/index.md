---
layout: page
title: Install - FreeBSD
---

# Installing Ronin on FreeBSD

## Copy/Paste Instructions

```shell
sudo pkg install -y gcc make ruby readline sqlite
sudo gem install ronin
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo pkg install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo pkg install -y ruby
```

{% include install/c_libraries.md %}

```shell
sudo pkg install -y readline sqlite
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
