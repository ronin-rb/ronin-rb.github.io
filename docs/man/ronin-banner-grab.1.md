---
layout: page
title: Docs - Man Pages - ronin-banner-grab
---

## NAME

ronin-banner-grab - Fetches the banner from one or more TCP services

## SYNOPSIS

`ronin banner-grab` [*options*] {*HOST*:*PORT*} ...

## DESCRIPTION

Fetches the banner from one or more TCP services.

## ARGUMENTS

*HOST*:*PORT*
: A TCP service to fetch the banner from.

## OPTIONS

`-f`, `--file` *FILE*
: Optional file to read target values from.

`--with-host-port`
: Print the service with each banner.

`-h`, `--help`
: Print help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-cert-grab](ronin-cert-grab.1.html)