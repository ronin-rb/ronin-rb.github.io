---
layout: page
title: Docs - Man Pages - ronin-listener-new-http
---

## SYNOPSIS

`ronin-listener new http` [*options*] [*PATH*]

## DESCRIPTION

Creates a new standalone HTTP listener Ruby script.

## ARGUMENTS

*PATH*
: The path to the new Ruby script file to create.

## OPTIONS

`-H`, `--host` *IP*
: The interface to listen on. Defaults to `0.0.0.0` if not given.

`-p`, `--port` *PORT*
: The port to listen on. Defaults to `8080` if not given.

`--vhost` *HOST*
: The `Host:` header to filter requests by.

`-R`, `--root` *DIR*
: The root directory to filter requests by.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-listener-new](ronin-listener-new.1.html) [ronin-listener-new-dns](ronin-listener-new-dns.1.html)
