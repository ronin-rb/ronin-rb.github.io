---
layout: page
title: Docs - Man Pages - ronin-db-ports
---

## NAME

ronin-db-ports - Manages port numbers in the database

## SYNOPSIS

`ronin-db ports` [*options*]

## DESCRIPTION

Manages Ports.

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
: Adds the URL to the database.

`--import` *FILE*
: Imports the URLs from the given *FILE*.

`--delete` *VALUE*
: Deletes the URL from the database.

`--delete-all`
: Deletes every URL from the database.

`--named` *NAME*
: Searches for all Ports that contain *NAME* in it's name.

`-N`, `--numer` *PORT*
: Searches for all Ports that are associated with the port number.

`-P`, `--with-protocol` [`tcp`\|`udp`]
: Searches for all Ports that are associated with the protocol.

`-S`, `--with-service` *SERVICE*
: Searches for all Ports that are associated with the service.

`-I`, `--with-ip` *IP*
: Searches for all Ports associated with the IP address.

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


