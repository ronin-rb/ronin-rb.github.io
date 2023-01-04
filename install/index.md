---
layout: default
title: Install
---

# Install

## Bash Script

The [ronin-install.sh] bash script will auto-detect the OS and package manager,
install all external dependencies from the system's package manager, and then
installs Ronin. Supports Debian, Ubuntu, Fedora, OpenSUSE, Arch, macOS, and
FreeBSD.

```shell
curl -o ronin-install.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh --pre
```

## Manual Instructions

If you do not want to use an automatic installation shell script, there are
manual installation instructions:

* [Ubuntu](ubuntu/)
* [Fedora](fedora/)
* [OpenSUSE](opensuse/)
* [Arch](arch/)
* [macOS](macos/)
* [FreeBSD](freebsd/)

## Docker

There are also [Docker images] available:

{% highlight shell %}
docker pull roninrb/ronin
docker run --mount type=bind,source="$$HOME",target=/home/ronin -it ronin
{% endhighlight %}

## Windows

Windows users are recommended to either use [WSL2] or use [Docker][Docker on
Windows] to run the [Docker images].

[ronin-install.sh]: https://github.com/ronin-rb/scripts/blob/main/ronin-install.sh
[Docker images]: https://hub.docker.com/r/roninrb/ronin
[WSL2]: https://learn.microsoft.com/en-us/windows/wsl/install
[Docker on Windows]: https://docs.docker.com/desktop/install/windows-install/
