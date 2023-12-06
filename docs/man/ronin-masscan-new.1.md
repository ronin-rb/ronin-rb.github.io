---
layout: page
title: Docs - Man Pages - ronin-masscan-new
---

## NAME

ronin-masscan-new - Generates a new masscan ruby script

## SYNOPSIS

`ronin-masscan new` [options] *FILE*

## DESCRIPTION

Generates a new masscan scanner or parser Ruby script that uses the
`ronin-masscan`  library.

## ARGUMENTS

*FILE*
: The path to the new Ruby script to generate.

## OPTIONS

`--parser`
: Generates a new masscan output file parser Ruby script.

`--scanner`
: Generates a new masscan scanner Ruby script.

`--printing`
: Adds additional code to the Ruby script that prints the masscan scan data.
  Is compatible with both `--parser` and `--scanner`.

`--import`
: Adds additional code to the Ruby script that imports the masscan scan data.
  Is compatible with both `--parser` and `--scanner`.

`--output-file` *OUTPUT_FILE*
: Parses or writes the scan results to the given output File.
  Is compatible with both `--parser` and `--scanner`.

`-p`, `--port` {*PORT* \| *PORT1*-*PORT2*},...
: Specifies the ports to scan. Not compatible with the `--parser` option.

`--ips ` {*IP* \| *IP-range*}[,...]
: Adds a target to scan. May be an IP or a IP CIDR range
  (ex: `192.168.1.1/24`). The option may be specified more than once.
  Not compatible with the `--parser` option.

`-h`, `--help`
: Print help information

## EXAMPLES

Generates a new masscan scanner Ruby script that scans `192.168.1.*`, ports 22,
80, 443, and 8000 through 9000:

    $ ronin-masscan new scanner.rb --ips '192.168.1.*' --ports 22,80,443,8000-9000

Generates a new masscan output file parser script that parses
`path/to/masscan.bin` and prints the scan information:

    $ ronin-masscan new parser.rb --parser --output-file path/to/masscan.bin --printing

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-masscan-scan](ronin-masscan-scan.1.html), [ronin-masscan-print](ronin-masscan-print.1.html), [ronin-masscan-import](ronin-masscan-import.1.html)

