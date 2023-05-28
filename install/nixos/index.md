---
layout: page
title: Install - Nix
---

# Installing Ronin on Nix

## Copy/Paste Instructions

```shell
nix-env -iA ronin
```

## Detailed Breakdown

Required dependencies will be installed automatically.

{% include install/ruby.md %}

Since `nixpkgs-23.05` and `nixos-23.05`, Nix package manager uses Ruby 3.1 as default. So we should check what is the version of `nixpkgs`.

```shell
nix-channel --list
# nixpkgs https://nixos.org/channels/nixpkgs-22.11
```

If we are using the version before `nixpkgs-23.05`, we should add the more recent version of channel.

```
nix-channel --add https://nixos.org/channels/nixpkgs-23.05  # or nixpkgs-unstable
```

or `nixos-23.05` if we're using NixOS.

```
nix-channel --add https://nixos.org/channels/nixos-23.05  # or nixos-unstable
nix-channel --update
```

### Ronin

Now that everything else is installed, it is time to install Ronin!

If we're not using NixOS,

```shell
nix-env -iA nixpkgs.ronin
```

If we're using NixOS,

```shell
nix-env -iA nixos.ronin
```

{% include install/post_install.md %}

{% include install/troubleshooting.md %}
