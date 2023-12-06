---
layout: page
title: Docs - Man Pages - ronin-wordlists-download
---

## SYNOPSIS

`ronin-wordlists` `download` [*options*] {*NAME* \| *URL*}

## DESCRIPTION

Downloads a wordlist into the `ronin-wordlist`'s cache directory or an
alternate directory.

## ARGUMENTS

*NAME*
: The name of the known wordlist to install.

*URL*
: The URL of the wordlist to install.

## OPTIONS

`-d`, `--wordlist-dir` *DIR*
: The alternative wordlist directory to download the wordlist file into.

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

[ronin-wordlists-list](ronin-wordlists-list.1.html) [ronin-wordlists-remove](ronin-wordlists-remove.1.html) [ronin-wordlists-update](ronin-wordlists-update.1.html) [ronin-wordlists-purge](ronin-wordlists-purge.1.html)
