---
layout: page
title: Docs - Using ronin-repos
---

# Using ronin-repos

[ronin-repos] allows managing Ronin repositories. Ronin repositories are
3rd-party git repositories that can contain exploits, payloads, or any other
kind of code. Once a Ronin repository containing exploits or payloads is
installed, they can be listed or ran using the [ronin-exploits] and
[ronin-payloads] commands.

[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#synopsis
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#synopsis

## Installing Repos

Ronin repositories can be installed using the `ronin-repos install` command
and the git repository's URI:

```shell
$ ronin-repos install https://github.com/ronin-rb/example-repo.git
>>> Installing repository from https://github.com/ronin-rb/example-repo.git ...
Cloning into '/home/postmodern/.cache/ronin-repos/example-repo'...
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 7 (delta 1), reused 7 (delta 1), pack-reused 0
Receiving objects: 100% (7/7), done.
Resolving deltas: 100% (1/1), done.
```

## Listing Repos

Installed repositories can be listed using the `ronin-repos list` command:

```shell
$ ronin-repos list
  example-repo
```

Additional information about a specific installed repository can be viewed with
`ronin-repos show`:

```shell
$ ./bin/ronin-repos show example-repo
[ example-repo ]

  Name:  example-repo
  URI:   https://github.com/ronin-rb/example-repo.git
  Files: 
    * README.md
    * exploits/example_exploit.rb
    * payloads/example_payload.rb
```

## Updating Repos

Installed repositories can be updated using the `ronin-repos update` command:

```shell
$ ronin-repos update
>>> Updating repository example-repo ...
```

Or a single repository can be updated:

```shell
$ ronin-repos update example-repo
>>> Updating repository example-repo ...
```

## Uninstalling Repos

Installed repositories can be uninstalled using the `ronin-repos remove`
command:

```shell
ronin-repos remove example-repo
```

If you want to uninstall *all* installed repositories, use the
`ronin-repos purge` command:

```shell
ronin-repos purge
```

<div class="level">
  <div class="level-left">
    <a class="button" href="../using-ronin-db/">
      &laquo; Using ronin-db
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="../index.html#guides">
      &#x2303; Guides
    </a>
  </div>
</div>
