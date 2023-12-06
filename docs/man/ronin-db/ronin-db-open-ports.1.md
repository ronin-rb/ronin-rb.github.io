---
layout: page
title: Docs - Man Pages - ronin-db-open-ports
---

## NAME

ronin-db-open-ports - Queries OpenPorts

## SYNOPSIS

`ronin-db open-ports` [*options*]

## DESCRIPTION

Queries OpenPorts.

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

`-p`, `--with-port` *PORT*
: Searches for all OpenPorts that are associated with the port number.

`-P`, `--with-protocol` [`tcp`\|`udp`]
: Searches for all OpenPorts that are associated with the protocol.

`-S`, `--with-service` *SERVICE*
: Searches for all OpenPorts that are associated with the service.

`-I`, `--with-ip` *IP*
: Searches for all OpenPorts associated with the IP address.

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


