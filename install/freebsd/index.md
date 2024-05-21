---
layout: page
title: Install - FreeBSD
js: ["copy-button.js"]
---

# Installing Ronin on FreeBSD

## Copy/Paste Instructions

```shell
sudo pkg install -y gcc make devel/pkgconf ruby deve/ruby-gems git zip
sudo gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

```shell
sudo pkg install -y gcc make devel/pkgconf
```

{% include install/runtime_deps.md %}

```shell
sudo pkg install -y git zip
```

{% include install/ruby.md %}

```shell
sudo pkg install -y ruby devel/ruby-gems
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
