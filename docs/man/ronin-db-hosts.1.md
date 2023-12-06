---
layout: page
title: Docs - Man Pages - ronin-db-hosts
---

## NAME

ronin-db-hosts - Manages host names in the database

## SYNOPSIS

`ronin-db hosts` [*options*]

## DESCRIPTION

Manages host names.

## OPTIONS

`--db` *NAME*
: The database to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to.

  * **sqlite3**: `sqlite3:relative/path.db` or `sqlite3:///absolute/path.db`
  * **mysql**: `mysql://user:password@host/database`
  * **postgres**: `postgres://user:password@host/database`

`--db-file` *PATH*
: The sqlite3 database file to use.

`-v`, `--verbose`
: Enable verbose output.

`--add` *VALUE*
: Adds the hostname to the database.

`--import` *FILE*
: Imports the credentials from the given *FILE*.

`--delete` *VALUE*
: Deletes a value from the database.

`--delete-all`
: Deletes every value from the database.

`-I`, `--with-ip` *IP*
: Searches for HostNames associated with the IP address.

`-p`, `--with-port` *PORT*
: Searches for HostNames associated with the *PORT*.

`-D`, `--domain` *DOMAIN*
: Searches for HostNames belonging to the DOMAIN (`co.uk`).

`-T`, `--tld` *TLD*
: Searches for HostNames with the Top-Level-Domain (TLD) (`ru`).

`-h`, `--help`
: Print help information.

## ENVIRONMENT

*HOME*
: Alternate location for the user's home directory.

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


