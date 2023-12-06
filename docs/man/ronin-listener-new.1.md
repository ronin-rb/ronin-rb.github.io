---
layout: page
title: Docs - Man Pages - ronin-listener-new
---

## NAME

ronin-listener-new - Creates a new DNS or HTTP listener Ruby script

## SYNOPSIS

`ronin-listener new` [*options*] [*COMMAND*]

## DESCRIPTION

Creates a new DNS or HTTP listener Ruby script.

## ARGUMENTS

*COMMAND*
: The optional command to get detailed new information on.

## OPTIONS

`-h`, `--help`
: Print help information

## COMMANDS

*dns*
: Generates a new standalone DNS listener Ruby script.

*http*
: Generates a new standalone HTTP listener Ruby script.

*help*
: Lists available `ronin-listener new` commands.

## EXAMPLES

Generate a new DNS listener Ruby script:

    $ ronin-listener new dns file.rb

Generate a new HTTP listener Ruby script:

    $ ronin-listener new http file.rb

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-listener-new-dns](ronin-listener-new-dns.1.html) [ronin-listener-new-http](ronin-listener-new-http.1.html)

