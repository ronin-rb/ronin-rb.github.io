---
layout: page
title: Install - macOS
js: ["copy-button.js"]
---

# Installing Ronin on macOS

## Copy/Paste Instructions

```shell
brew install gcc make ruby git zip
brew pin ruby
echo 'PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
echo 'PATH="$(gem env gemdir)/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
sudo gem install ronin
```

## Detailed Breakdown

{% include install/build_deps.md %}

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

{% include install/runtime_deps.md %}

```shell
brew install git zip
```

{% include install/ronin.md %}

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
