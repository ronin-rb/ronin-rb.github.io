---
layout: page
title: Docs - Man Pages - ronin-typo
---

## NAME

ronin-typo - Generates typos in words

## SYNOPSIS

`ronin typo` [*options*] [*WORD* ...]

## DESCRIPTION

Generates typos in words.

## ARGUMENTS

*WORD*
: The optional word to typo.

## OPTIONS

`-f`, `--file` *FILE*
: Optional file to process.

`--omit-chars`
: Toggles whether to omit repeated characters.

`--repeat-chars`
: Toggles whether to repeat single characters.

`--swap-chars`
: Toggles whether to swap certain common character pairs.

`--change-suffix`
: Toggles whether to change the suffix of words.

`-E`, `--enum`
: Enumerates over every possible typo of a word.

`-h`, `--help`
: Print help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-bitflip](ronin-bitflip.1.html) [ronin-homoglyph](ronin-homoglyph.1.html)
