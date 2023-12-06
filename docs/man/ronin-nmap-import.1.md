---
layout: page
title: Docs - Man Pages - ronin-nmap-import
---

## NAME

ronin-nmap-import - Imports an nmap XML file into ronin-db

## SYNOPSIS

`ronin-nmap import` [*options*] *XML_FILE*

## DESCRIPTION

Imports the nmap XML file data into the Ronin database.

## ARGUMENTS

*XML_FILE*
: The nmap XML file to import.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to
  (ex: `postgres://user:password@host/db`).

`--db-file` *PATH*
: The sqlite3 database file to use.

`-h`, `--help`
: Print help information

## ENVIRONMENT

*HOME*
: The user's home directory.

*XDG_CONFIG_HOME*
: Alternate location for the `~/.config` directory.

*XDG_DATA_HOME*
: Alternate location for the `~/.local/share` directory.

## FILES

`~/.local/share/ronin-db/database.sqlite3`
: The default sqlite3 database file.

`~/.config/ronin-db/database.yml`
: Optional database configuration.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>


