---
layout: default
title: Install
---

# Install

The [ronin] gem can be installed via the [ronin-up.sh] script or by copy/pasting
the following commands.

## curl && bash

{% highlight shell %}
curl -o ronin-up.sh https://github.com/ronin-rb/scripts/main/ronin-up.sh && bash ronin-up.sh
{% endhighlight %}

## Debian / Ubuntu

{% highlight shell %}
sudo apt install -y gcc make ruby-full libreadline-dev libsqlite3-dev libxml2-dev libxslt1-dev
sudo gem install ronin
{% endhighlight %}

## RedHat / Fedora

{% highlight shell %}
sudo dnf install -y gcc make ruby readline-devel sqlite-devel libxml2-devel libxslt-devel
sudo gem install ronin
{% endhighlight %}

## macOS + Homebrew

{% highlight shell %}
brew install readline sqlite libxml2 libxslt
sudo gem install ronin
{% endhighlight %}

## Docker

{% highlight shell %}
docker pull roninrb/ronin
docker run --mount type=bind,source="$$HOME",target=/home/ronin -it ronin
{% endhighlight %}

[ronin]: https://rubygems.org/gems/ronin
[ronin-up.sh]: https://github.com/ronin-rb/scripts/blob/main/ronin-up.sh
