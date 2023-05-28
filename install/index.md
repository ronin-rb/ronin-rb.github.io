---
layout: page
title: Install
---

# Install

## Bash Script

The [ronin-install.sh] bash script will auto-detect the OS and package manager,
install all external dependencies from the system's package manager, and then
installs Ronin. Supports Debian, Ubuntu, Fedora, OpenSUSE, Arch, macOS, and
FreeBSD.

{% include install_script.md %}

If you encounter an error when running `ronin-install.sh`, please report it to
the [scripts repository].

[scripts repository]: https://github.com/ronin-rb/scripts/issues/new

## Manual Instructions

If you do not want to use an automatic installation shell script, there are
manual installation instructions:

* [Ubuntu](ubuntu/)
* [Fedora](fedora/)
* [OpenSUSE](opensuse/)
* [Arch](arch/)
* [macOS](macos/)
* [FreeBSD](freebsd/)
* [Nix](nix/)

## Docker

There are also [Docker images] available:

{% include docker_install.md %}

Additionally, if you want to mount your home directory into the docker image:

```shell
docker run --mount type=bind,source="$HOME",target=/home/ronin -it ronin
```

## Windows

Windows users are recommended to either use [WSL2], or use [Docker][Docker on
Windows] and run the [Docker images].

[ronin-install.sh]: https://github.com/ronin-rb/scripts/blob/main/ronin-install.sh
[Docker images]: https://hub.docker.com/r/roninrb/ronin
[WSL2]: https://learn.microsoft.com/en-us/windows/wsl/install
[Docker on Windows]: https://docs.docker.com/desktop/install/windows-install/
