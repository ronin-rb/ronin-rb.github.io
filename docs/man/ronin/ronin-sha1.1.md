---
layout: page
title: Docs - Man Pages - ronin-sha1
---

## NAME

ronin-sha1 - Calculates SHA1 hashes of data

## SYNOPSIS

`ronin sha1` [*options*] [*FILE* ...]

## DESCRIPTION

Calculates SHA1 hashes of data.

## ARGUMENTS

*FILE*
: The optional file to read and process. If no *FILE* arguments are given,
  input will be read from `stdin`.

## OPTIONS

`-f`, `--file` *FILE*
: Optional file to process.

`--string` *STRING*
: Optional string to process.

`-M`, `--multiline`
: Process each line of input separately.

`-n`, `--keep-newlines`
: Preserves newlines at the end of each line.

`-h`, `--help`
: Print help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-md5](ronin-md5.1.html) [ronin-sha256](ronin-sha256.1.html) [ronin-sha512](ronin-sha512.1.html)
