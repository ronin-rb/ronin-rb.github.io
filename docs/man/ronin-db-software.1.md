---
layout: page
title: Docs - Man Pages - ronin-db-software
---

## NAME

ronin-db-software - Queries software in the database

## SYNOPSIS

`ronin-db software` [*options*]

## DESCRIPTION

Queries Software in the database.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to.

  * **sqlite3**: `sqlite3:relative/path.db` or `sqlite3:///absolute/path.db`
  * **mysql**: `mysql://user:password@host/database`
  * **postgres**: `postgres://user:password@host/database`

`--db-file` *PATH*
: The sqlite3 database file to use.

`-v`, `--verbose`
: Enables verbose output

`-N`, `--name` *NAME*
: Searches for all Software with the matching name.

`--named` *NAME*
: Searches for all Software containing the name.

`-V`, `--version` *VERSION*
: Searches for all Software with the matching version.

`--vendor` *VENDOR*
: Searches for all Software with the matching vendor name.

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


