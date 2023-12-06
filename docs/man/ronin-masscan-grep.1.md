---
layout: page
title: Docs - Man Pages - ronin-masscan-grep
---

## NAME

ronin-masscan-grep - Greps the scanned services from masscan scan file(s)

## SYNOPSIS

`ronin-masscan grep` [options] *PATTERN* *MASSCAN_FILE*

## DESCRIPTION

Searches through the scanned services in one or more masscan scan files for the
given pattern. The scanned services that contain the text pattern are then
printed with the text pattern highlighted in red.

This command specifically searches the "banner" records in
masscan output files generated using the `masscan` `--banners` option.

## ARGUMENTS

*PATTERN*
: The pattern to search for.

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

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-masscan-print](ronin-masscan-print.1.html)

