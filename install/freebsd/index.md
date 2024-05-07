---
layout: page
title: Install - FreeBSD
---

# Installing Ronin on FreeBSD

## Copy/Paste Instructions

```shell
sudo pkg install -y gcc make devel/pkgconf ruby deve/ruby-gems
sudo gem install ronin
```

## Detailed Breakdown

{% include install/cc_and_make.md %}

```shell
sudo pkg install -y gcc make devel/pkgconf
```

{% include install/ruby.md %}

```shell
sudo pkg install -y ruby devel/ruby-gems
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
