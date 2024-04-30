---
layout: page
title: Install - OpenSUSE
---

# Installing Ronin on OpenSUSE

## Copy/Paste Instructions

```shell
sudo zypper -n in -l gcc make awk ruby-devel readline-devel
sudo gem install ronin
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
sudo zypper -n in -l gcc make awk
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
  `awk` is not installed by default in the official OpenSUSE docker image.
  </div>
</article>


{% include install/ruby.md %}

```shell
sudo zypper -n in -l ruby-devel
```

{% include install/c_libraries.md %}

```shell
sudo zypper -n in -l readline-devel
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
