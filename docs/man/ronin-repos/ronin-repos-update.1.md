---
layout: page
title: Docs - Man Pages - ronin-repos-update
---

## NAME

ronin-repos-update - Updates all or one repository from the cache directory

## SYNOPSIS

`ronin-repos update` [*options*] [*REPO*]

## DESCRIPTION

Updates all repositories or just one.

## ARGUMENTS

*REPO*
: The optional repository name to only update.

## OPTIONS

`-C`, `--cache-dir` *DIR*
: Overrides the default cache directory.

`-h`, `--help`
: Prints help information.

## EXAMPLES

`ronin-repos update`
: Updates all installed repositories.

`ronin update repo`
: Updates the specific repository named `repo`.

## ENVIRONMENT

*HOME*
: Specifies the home directory of the user. Ronin will search for the
  `~/.cache/ronin-repos` cache directory within the home directory.

*XDG_CACHE_HOME*
: Specifies the cache directory to use. Defaults to `$HOME/.cache`.

## FILES

`~/.cache/ronin-repos/`
: Installation directory for all repositories.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-repos](ronin-repos.1.html) [ronin-repos-repos-install](ronin-repos-repos-install.1.html) [ronin-repos-list](ronin-repos-list.1.html) [ronin-repos-remove](ronin-repos-remove.1.html) [ronin-repos-purge](ronin-repos-purge.1.html)
