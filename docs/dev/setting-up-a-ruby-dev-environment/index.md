---
layout: page
title: Setting up a Ruby Development Environment
---

# Setting up a Ruby Development Environment

If you want to contribute to Ronin's [repositories][ronin-rb], you will need to
setup a Ruby Development Environment.

## Recommended: ronin-dev.sh

The recommended way to setup a Ruby Development Environment for Ronin is to use
the [ronin-dev.sh] script. This script will install `ruby`, `git`, `gcc`,
`make`, etc, and clone all Ronin repositories from [GitHub][ronin-rb].

[ronin-dev.sh]: https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-dev.sh
[ronin-rb]: https://github.com/ronin-rb

### curl && bash

Copy and paste the following command into the terminal:

```shell
curl -o ronin-dev.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-dev.sh && bash ronin-dev.sh
```

### wget && bash

If you have `wget` installed instead of `curl`, copy and paste the following
command into the terminal:

```shell
wget -O ronin-dev.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-dev.sh && bash ronin-dev.sh
```

### Manual Steps

If you do not wish to use an automated installation/setup script, you can
perform the steps manually:

#### Ubuntu

```shell
sudo apt install -y git gcc g++ make libreadline-dev libyaml-dev libsqlite3-dev ruby-full
git clone https://github.com/ronin-rb/REPO.git
```

#### Fedora

```shell
sudo dnf install -y git gcc gcc-g++ make readline-devel libyaml-devel sqlite-devel ruby-devel ruby-bundled-gems
git clone https://github.com/ronin-rb/REPO.git
```

#### OpenSUSE

```shell
sudo zypper -n in -l git gcc gcc-c++ make readline-devel libyaml-devel sqlite3-devel ruby-devel
git clone https://github.com/ronin-rb/REPO.git
```

#### Arch

```shell
sudo pacman -Sy --noconfirm git gcc g++ make readline libyaml sqlite ruby
git clone https://github.com/ronin-rb/REPO.git
```

#### macOS

```shell
brew install git gcc g++ make readline libyaml sqlite ruby
brew pin ruby

cat >> ~/.zshrc <<CONFIG
PATH="\$(brew --prefix ruby)/bin:\$PATH"
PATH="\$(gem env gemdir)/bin:\$PATH"
CONFIG

git clone https://github.com/ronin-rb/REPO.git
```

#### FreeBSD

```shell
pkg install -y git gcc g++ make readline libyaml sqlite ruby
git clone https://github.com/ronin-rb/REPO.git
```

## Advanced: chruby + ruby-install

Many Ruby developers use [chruby] and [ruby-install] to install specific
versions of Ruby and switch between them. [chruby] is the simplest Ruby
switcher, is only ~100 lines of code, and switches between Rubies by modifying
the `PATH`, `GEM_HOME,` and `GEM_PATH` environment variables.
[chruby] also supports [automatically selecting the Ruby version][chruby-auto]
based on a `.ruby-version` file in a project's directory.

[chruby]: https://github.com/postmodern/chruby#readme
[chruby-auto]: https://github.com/postmodern/chruby#auto-switching
[ruby-install]: https://github.com/postmodern/ruby-install#readme

## Advanced: rbenv + ruby-build

Many Ruby developers use [rbenv] and [ruby-build] to install specific versions
of Ruby and switch between them. [rbenv] switches between Ruby versions by
generating "shims" or "bin stubs" for all Ruby commands, which then executes
the desired Ruby version. [rbenv] also supports
[automatically selecting the Ruby version][rbenv-how-it-works] based on a
`.ruby-version` file in a project's directory.

[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-how-it-works]: https://github.com/rbenv/rbenv#how-it-works
[ruby-build]: https://github.com/rbenv/ruby-build#readme
