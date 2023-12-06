---
layout: page
title: Docs - Man Pages - ronin-masscan-print
---

## NAME

ronin-masscan-print - Prints the scanned IPs and ports from masscan scan file(s)

## SYNOPSIS

`ronin-masscan print` [options] *MASSCAN_FILE*

## DESCRIPTION

Parses one or more masscan scan files and pretty prints the scanned IPs and
open ports. The command also supports filtering the scanned ports by IP,
IP range, domain, or port.

## ARGUMENTS

*MASSCAN_FILE*
: The masscan scan file to import.

## OPTIONS

`-P`, `--protocol` `tcp`|`udp`
: Filters the targets by the protocol of the open port.

`--ip` *IP*
: Filters the targets by a specific IP address.

`--ip-range` *CIDR*
: Filters the targets by a CIDR IP range (ex: `192.168.1.0/24`).

`-p`, `--ports` {*PORT* | *PORT1-PORT2*},...
: Filter `IP:PORT` or `HOST:PORT` pairs who's ports are in the gvien port list.
  The port list is a comma separated list of port numbers (`443`) or port
  ranges (`8000-9000`).

`--with-app-protocol` *APP_PROTOCOL*,...
: Filters targets by the app protocol names.

`--with-payload` *STRING*
: Filters targets by the payload substring.

`--with-payload-regex` `/`*REGEX*`/`
: Filters targets how's payload string matches the regular expression.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-masscan-dump](ronin-masscan-dump.1.html)

