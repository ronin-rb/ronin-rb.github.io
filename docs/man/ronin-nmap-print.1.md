---
layout: page
title: Docs - Man Pages - ronin-nmap-print
---

## NAME

ronin-nmap-print - Print the scanned hosts from nmap XML file(s).

## SYNOPSIS

`ronin-nmap print` [options] *XML_FILE* [...]

## DESCRIPTION

Parses an one or more nmap XML files and pretty prints the scanned hosts.
The command also supports filtering the nmap targets by IP, IP range, domain,
OS, port, service, or NSE script.

## ARGUMENTS

*XML_FILE*
: The nmap XML file to import.

## OPTIONS

`--ip` *IP*
: Filters the targets by a specific IP address.

`--ip-range` *CIDR*
: Filter the targets by a CIDR IP range (ex: `192.168.1.0/24`).

`--domain` *DOMAIN*
: Filters the targets by a domain (ex: `example.com`).

`--with-os` *OS*
: Filters the targets by Operating System (ex: `Linux`, `Windows`, etc).

`--with-ports` {*PORT* \| *PORT1*`-`*PORT2*}`,`...
: Filter targets that have open ports in the port list.
  The port list is a comma separated list of port numbers (`443`) or port
  ranges (`8000-9000`).

`--with-service` *SERVICE*[`,`...]
: Filters targets who are running one of the specified services.

`--with-script` *SCRIPT*[`,`...]
: Filters targets that have the NSE script name(s).

`--with-script-output` *STRING*
: Filters targets that have NSE script output contain the string.

`--with-script-regex` `/`*REGEX*`/`
: Filters targets that have NSE script output that matches the regular
  expression.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-nmap-dump](ronin-nmap-dump.1.html) [ronin-nmap-grep](ronin-nmap-grep.1.html)

