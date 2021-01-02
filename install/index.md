---
layout: default
title: Install
---

# Install

The [ronin] gem can be installed via the [ronin-up.sh] script or by copy/pasting
the following commands.

## curl && bash

{% highlight %}
curl -o ronin-up.sh https://github.com/ronin-rb/scripts/main/ronin-up.sh && bash ronin-up.sh
{% endhighlight %}

## Debian / Ubuntu

{% highlight %}
sudo apt install -y gcc make ruby-full libreadline-dev libsqlite3-dev libxml2-dev libxslt1-dev
sudo gem install ronin
{% endhighlight %}

## RedHat / Fedora

{% highlight %}
sudo dnf install -y gcc make ruby readline-devel sqlite-devel libxml2-devel libxslt-devel
sudo gem install ronin
{% endhighlight %}

## macOS + Homebrew

{% highlight %}
brew install readline sqlite libxml2 libxslt
sudo gem install ronin
{% endhighlight %}

[ronin]: https://rubygems.org/gems/ronin
[ronin-up.sh]: https://github.com/ronin-rb/scripts/blob/main/ronin-up.sh
