---
layout: page
title: Install - Fedora
---

# Installing Ronin on Fedora

## Copy/Paste Instructions

```shell
sudo dnf install -y gcc make ruby-devel ruby-bundled-gems
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
  <div class="message-body" markdown="1">
`ruby-bundled-gems` is required for `net/ftp`, `net/imap`, `net/pop`, and
`net/smtp`. For some reason Fedora's `ruby` package does not automatically
install the `ruby-bundled-gems` package as a dependency of `ruby`.
  </div>
</article>

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
