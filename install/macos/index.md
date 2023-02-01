---
layout: page
title: Install - macOS
---

# Installing Ronin on macOS

## Copy/Paste Instructions

```shell
brew install gcc make ruby
brew pin ruby
echo 'PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
echo 'PATH="$(gem env gemdir)/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
brew install readline sqlite
sudo gem install ronin --pre
```

## Detailed Breakdown

{% include install/gcc_and_make.md %}

```shell
brew install gcc make
```

{% include install/ruby.md %}

```shell
brew install ruby
```

Next we will need to "pin" the Homebrew's version of Ruby.

```shell
brew pin ruby
```

Then we will need to make Homebrew's version of Ruby the default Ruby by adding
it to the `PATH` environment variable in `~/.zshrc` and reloading the shell's
configuration.

```shell
echo 'PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
echo 'PATH="$(gem env gemdir)/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

{% include install/c_libraries.md %}

```shell
brew install readline sqlite
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
