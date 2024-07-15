---
layout: page
title: Docs - Man Pages - ronin-wordlists-update
---

## SYNOPSIS

`ronin-wordlists` `update` [*options*] [*NAME*]

## DESCRIPTION

Updates a previously downloaded wordlist or all downloaded wordlists.

## ARGUMENTS

*NAME*
: The name of the known wordlist to update.

## OPTIONS

`-d`, `--wordlist-dir` *DIR*
: The alternative wordlist directory to update the wordlist.

`-h`, `--help`
: Prints help information.

## FILES

`~/.cache/ronin-wordlists`
: Default installation directory for wordlists.

## ENVIRONMENT

*HOME*
: Specifies the home directory of the user. Ronin will search for the
  `~/.cache/ronin-wordlists` cache directory within the home directory.

*XDG_CACHE_HOME*
: Specifies the cache directory to use. Defaults to `$HOME/.cache`.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-wordlists-download](ronin-wordlists-download.1.html) [ronin-wordlists-list](ronin-wordlists-list.1.html) [ronin-wordlists-remove](ronin-wordlists-remove.1.html) [ronin-wordlists-purge](ronin-wordlists-purge.1.html)
