---
layout: page
title: Install - Termux
js: ["copy-button.js"]
---

# Installing Ronin on Termux

## Copy/Paste Instructions

```shell
pkg install -y binutils clang make ruby libxml2 libxslt git zip
gem install nokogiri --platform ruby -- --use-system-libraries
gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

```shell
pkg install -y binutils clang make
```

{% include install/ruby.md %}

```shell
pkg install -y ruby
```

{% include install/runtime_deps.md %}

```shell
pkg install -y git zip
```

### Nokogiri

In order to install the [nokogiri] gem, which parses HTML and XML, we will need
to install the `libxml2` and `libxslt` packages:

```shell
pkg install -y libxml2 libxslt
```

The [nokogiri] gem will attempt to build it's own copy of `libxml2`, however the
tar archive contains hardlinks, which are not allowed on the Android file
system. So we must explicitly install [nokogiri], but tell it to build against
the system's `libxml2` and `libxslt` packages we installed above:

```shell
gem install nokogiri --platform ruby -- --use-system-libraries
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
