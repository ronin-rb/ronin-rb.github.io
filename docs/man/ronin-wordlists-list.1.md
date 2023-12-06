---
layout: page
title: Docs - Man Pages - ronin-wordlists-list
---

## SYNOPSIS

`ronin-wordlists` `list` [*options*] [*NAME*]

## DESCRIPTION

Lists the downloaded wordlists.

## ARGUMENTS

*NAME*
: The optional name of the wordlist to search for.

## OPTIONS

`-d`, `--wordlist-dir` *DIR*
: The alternative wordlist directory to search.

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

[ronin-wordlists-download](ronin-wordlists-download.1.html) [ronin-wordlists-remove](ronin-wordlists-remove.1.html) [ronin-wordlists-update](ronin-wordlists-update.1.html)

