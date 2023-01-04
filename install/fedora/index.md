---
layout: page
title: Install - Fedora
---

# Installing Ronin on Fedora

## Copy/Paste Instructions

```shell
sudo dnf install -y gcc make ruby-devel ruby-bundled-gems readline-devel sqlite-devel
sudo gem install ronin --pre
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo dnf install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo apt install -y ruby-devel ruby-bundled-gems
```

**Note:** `ruby-bundled-gems` is required for `net/ftp`, `net/imap`, `net/pop`, and `net/smtp`. For some reason Fedora's `ruby` package does not automatically
install the `ruby-bundled-gems` package as a dependency of `ruby`.

{% include install/c_libraries.md %}

```shell
sudo dnf install -y readline-devel sqlite-devel
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
