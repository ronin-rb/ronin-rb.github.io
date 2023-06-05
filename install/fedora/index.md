---
layout: page
title: Install - Fedora
---

# Installing Ronin on Fedora

## Copy/Paste Instructions

```shell
sudo dnf install -y gcc make ruby-devel ruby-bundled-gems readline-devel sqlite-devel
sudo gem install ronin
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo dnf install -y gcc make
```

{% include install/ruby.md %}

```shell
sudo dnf install -y ruby-devel ruby-bundled-gems
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body">
    <code>ruby-bundled-gems</code> is required for <code>net/ftp</code>,
    <code>net/imap</code>, <code>net/pop</code>, and <code>net/smtp</code>.
    For some reason Fedora's <code>ruby</code> package does not automatically
    install the <code>ruby-bundled-gems</code> package as a dependency of
    <code>ruby</code>.
  </div>
</article>

{% include install/c_libraries.md %}

```shell
sudo dnf install -y readline-devel sqlite-devel
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}

If you get an exception saying `cannot load such file -- net/ftp` when trying to
run `ronin irb` or requiring `ronin/support` in Ruby, this is because the
Fedora `ruby-bundled-gems` rpm package isn't installed. You can fix this by
running:

```shell
sudo dnf install -y ruby-bundled-gems
```
