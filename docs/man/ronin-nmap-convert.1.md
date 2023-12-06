---
layout: page
title: Docs - Man Pages - ronin-nmap-convert
---

## NAME

ronin-nmap-convert - Converts an nmap XML file to JSON or CSV

## SYNOPSIS

`ronin-nmap convert` [`--format` `json`\|`csv`] *XML_FILE* [*OUTPUT_FILE*]

## DESCRIPTION

Converts an nmap XML file to JSON or CSV.

## ARGUMENTS

*XML_FILE*
: The nmap XML file to import.

*OUTPUT_FILE*
: The optional output file to write to.

## OPTIONS

`-F`, `--format` `json`|`csv`
: Sets the output conversion format to JSON or CSV. If the option is not given,
  the output conversion format Will be inferred from the *OUTPUT_FILE* file
  extension.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>


