---
layout: page
title: Docs - Man Pages - ronin-nmap-grep
---

## NAME

ronin-nmap-grep - Parses and searches nmap XML file(s) for the pattern.

## SYNOPSIS

`ronin-nmap grep` [options] *PATTERN* *XML_FILE* [...]

## DESCRIPTION

Parses one or more nmap XML files and searches the scan data for the text
pattern. The scanned hosts that contain the text pattern are then printed
with the text pattern highlighted in red.

## ARGUMENTS

*PATTERN*
: The text pattern to search for.

*XML_FILE*
: The nmap XML file to import.

## OPTIONS

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-nmap-print](ronin-nmap-print.1.html)

