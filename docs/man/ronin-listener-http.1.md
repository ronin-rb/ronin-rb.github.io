---
layout: page
title: Docs - Man Pages - ronin-listener-http
---

## NAME

ronin-listener-http - Starts a HTTP server for receiving exfiltrated data

## SYNOPSIS

`ronin-listener http` [*options*]

## DESCRIPTION

Starts a HTTP server for receiving exfiltrated data.

## OPTIONS

`-o`, `--output` *FILE*
: The output file to write the received DNS queries to.

`-F`, `--output-format` `txt`|`csv`|`json`|`ndjson`
: The output format to use. If not specified, the output format will be inferred
  from the output file's extension. If the output format cannot be inferred from
  the output file's extension, then it will default to `txt` format.

`-H`, `--host` *IP*
: The interface to listen on. Defaults to `0.0.0.0` if not given.

`-p`, `--port` *PORT*
: The port to listen on. Defaults to `8080` if not given.

`--vhost` *HOST*
: The `Host:` header to filter requests by.

`-R`, `--root` *DIR*
: The root directory to filter requests by. Defaults to `/` if not given.

`-h`, `--help`
: Prints help information.

## EXAMPLES

Runs a HTTP listener on `127.0.0.1:8080` that will receive any request:

    $ ronin-listener http -p 8080

Runs a HTTP listener on `127.0.0.1:8080` for the virtual-host `example.com`:

    $ ronin-listener http -p 8080 --vhost example.com

Run a HTTP listener on `0.0.0.0:80` as root:

    $ sudo ronin-listener http

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-listener-dns](ronin-listener-dns.1.html)

