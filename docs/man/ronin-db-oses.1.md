---
layout: page
title: Docs - Man Pages - ronin-db-oses
---

## NAME

ronin-db-oses - Queries OSes in the database

## SYNOPSIS

`ronin-db oses` [*options*]

## DESCRIPTION

Queries OSes in the database.

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
: Searches for all OSes with the matching name.

`--named` *NAME*
: Searches for all OSes containing the name.

`-F`, `--flavor` `linux`\|`bsd`
: Searches for all OSes with the matching flavor.

`-V`, `--version` *VERSION*
: Searches for all OSes with the matching version.

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


