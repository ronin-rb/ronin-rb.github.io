---
layout: page
title: Docs - Man Pages - ronin-nmap-new
---

## NAME

ronin-nmap-new - Generates a new nmap ruby script

## SYNOPSIS

`ronin-nmap new` [options] *FILE*

## DESCRIPTION

Generates a new nmap scanner or parser Ruby script that uses the `ronin-nmap` 
library.

## ARGUMENTS

*FILE*
: The path to the new Ruby script to generate.

## OPTIONS

`--parser`
: Generates a new nmap XML parser Ruby script.

`--scanner`
: Generates a new nmap scanner Ruby script.

`--printing`
: Adds additional code to the Ruby script that prints the nmap XML scan data.
  Is compatible with both `--parser` and `--scanner`.

`--import`
: Adds additional code to the Ruby script that imports the nmap XML scan data.
  Is compatible with both `--parser` and `--scanner`.

`--xml-file` *XML_FILE*
: Parses or writes the scan results to the given XML File.
  Is compatible with both `--parser` and `--scanner`.

`--syn-scan`
: Enables SYN scanning. Only compatible with the `--scanner` option.

`-p`, `--port` {*PORT* \| \[*PORT1*\]-\[*PORT2*\]}[,...]
: Specifies the ports to scan. Not compatible with the `--parser` option.

`--target` *TARGET*
: Adds a target to scan. May be a host name, IP, IP CIDR range (ex:
  `192.168.1.1/24`), or IP glob range (ex: `192.168.*.1-4`).
  Not compatible with the `--parser` option.

`-h`, `--help`
: Print help information

## EXAMPLES

Generates a new nmap scanner Ruby script that scans `example.com`, ports 22, 80,
443, and 8000 through 9000:

    $ ronin-nmap new scanner.rb --target example.com --ports 22,80,443,8000-9000

Generates a new nmap XML parser script that parses `path/to/nmap.xml` and prints
the scan information:

    $ ronin-nmap new parser.rb --parser --xml-file path/to/nmap.xml --printing

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-nmap-scan](ronin-nmap-scan.1.html), [ronin-nmap-print](ronin-nmap-print.1.html), [ronin-nmap-import](ronin-nmap-import.1.html)

