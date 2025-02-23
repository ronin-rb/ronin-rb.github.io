---
layout: page
title: Install - OpenSUSE
js: ["copy-button.js"]
---

# Installing Ronin on OpenSUSE

## Copy/Paste Instructions

```shell
sudo zypper -n in -l gcc make awk ruby-devel git zip nmap masscan graphviz
sudo gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

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

{% include install/runtime_deps.md %}

```shell
sudo zypper -n in -l git zip
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
