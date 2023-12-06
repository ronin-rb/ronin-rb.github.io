---
layout: page
title: Docs - Man Pages - ronin-listener-new-dns
---

## SYNOPSIS

`ronin-listener new dns` [*options*] [*PATH*]

## DESCRIPTION

Creates a new standalone DNS listener Ruby script.

## ARGUMENTS

*PATH*
: The path to the new Ruby script file to create.

## OPTIONS

`-H`, `--host` *IP*
: The interface to listen on. Defaults to `0.0.0.0` if not given.

`-p`, `--port` *PORT*
: The port to listen on. Defaults to `5553` if not given.

`-d`, `--domain` *DOMAIN*
: The domain to receive queries for. Defaults to `example.com` if not given.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-listener-new](ronin-listener-new.1.html) [ronin-listener-new-http](ronin-listener-new-http.1.html)
