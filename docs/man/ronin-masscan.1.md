---
layout: page
title: Docs - Man Pages - ronin-masscan
---

## NAME

ronin-masscan - A CLI for working with masscan

## SYNOPSIS

`ronin-masscan` [*options*] [*COMMAND* [...]]

## DESCRIPTION

`ronin-masscan` provides various commands for automating `masscan`, parsing
scan output files, and importing scan data into the database.

## ARGUMENTS

*COMMAND*
: The `ronin-masscan` command to execute.

## OPTIONS

`-h`, `--help`
: Print help information

## COMMANDS

*completion*
: Manages the shell completion rules for `ronin-masscan`.

*convert*
: Converts an masscan scan file to JSON or CSV.

*dump*
: Dumps the scanned ports from masscan scan files.

*grep*
: Greps the scanned services from masscan scan file(s).

*import*
: Imports a masscan scan file into ronin-db.

*new*
: Generates a new masscan Ruby script.

*print*
: Prints the scanned IPs and ports from masscan scan file(s).

*scan*
: Runs masscan and outputs data as JSON or CSV or imports into the database.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-masscan-completion](ronin-masscan-completion.1.html) [ronin-masscan-convert](ronin-masscan-convert.1.html) [ronin-masscan-dump](ronin-masscan-dump.1.html) [ronin-masscan-grep](ronin-masscan-grep.1.html) [ronin-masscan-import](ronin-masscan-import.1.html) [ronin-masscan-new](ronin-masscan-new.1.html) [ronin-masscan-print](ronin-masscan-print.1.html) [ronin-masscan-scan](ronin-masscan-scan.1.html)

