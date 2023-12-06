---
layout: page
title: Docs - Man Pages - ronin-nmap-dump
---

## NAME

ronin-nmap-dump - Dumps the scanned ports from nmap XML file(s).

## SYNOPSIS

`ronin-nmap dump` [options] *XML_FILE* [...]

## DESCRIPTION

Dumps the scanned ports from nmap XML files into a variety of formats. The
output formats include:

* IP
* Hostname
* `IP:PORT`
* `HOST:PORT`
* URI

The command also supports filtering the nmap targets by IP, IP range, domain,
OS, port, service, or NSE script.

## ARGUMENTS

*XML_FILE*
: The nmap XML file to import.

## OPTIONS

`--print-ips`
: Only print the IP addresses of the targets (ex: `192.168.1.1`).

`--print-hosts`
: Only print the hostnames of the targets (ex: `example.com`).

`--print-ip-ports`
: Print IP address and port pairs for each target (ex: `192.168.1.1:443`).
  This is the default behavior.

`--print-host-ports`
: Print hostname and port pairs for each target (ex: `example.com:443`).

`--print-uris
: Print URIs for each target that has either `http` or `https` services
  (ex: `https://example.com` or `http://example.com:8080`).

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

`-p`, `--ports` {*PORT* | *PORT1-PORT2*},...
: Filter `IP:PORT` or `HOST:PORT` pairs who's ports are in the gvien port list.
  The port list is a comma separated list of port numbers (`443`) or port
  ranges (`8000-9000`).

`--services` *SERVICE*[`,`...]
: Filters `IP:PORT` or `HOST:PORT` pairs who's ports are running one of the
  specifiied services.

`-h`, `--help`
: Print help information

## EXAMPLES

Print `IP:PORT` pairs from the nmap XML file:

    $ ronin-nmap dump --print-ip-ports scan.xml

Print `IP:PORT` pairs with ports 22, 80, or 443, from the nmap XML file:

    $ ronin-nmap dump --print-ip-ports --ports 22,80,443 scan.xml

Print `HOST:PORT` pairs from the nmap XML file:

    $ ronin-nmap dump --print-host-ports scan.xml

Print target hostnames from the nmap XML file:

    $ ronin-nmap dump --print-hosts --with-port 22 scan.xml

Print URIs from the nmap XML file:

    $ ronin-nmap dump --print-uris scan.xml

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-nmap-print](ronin-nmap-print.1.html)

