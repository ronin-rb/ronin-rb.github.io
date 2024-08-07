---
layout: page
title: Docs - Man Pages - ronin-homoglyph
---

## NAME

ronin-homoglyph - Generates homoglyph equivalent words

## SYNOPSIS

`ronin homoglyph` [*options*] [*WORD* ...]

## DESCRIPTION

Generates homoglyph equivalent words.

## ARGUMENTS

*WORD*
: The optional word to homoglyph.

## OPTIONS

`-f`, `--file` *FILE*
: Optional file to process.

`-C`, `--char-set` `ascii`\|`greek`\|`cyrillic`\|`punctuation`\|`latin_numbers`\|`full_width`
: Selects the homoglyph character set.

`-E`, `--enum`
: Enumerates over every possible typo of a word.

`-h`, `--help`
: Print help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-bitflip](ronin-bitflip.1.html) [ronin-typo](ronin-typo.1.html)
