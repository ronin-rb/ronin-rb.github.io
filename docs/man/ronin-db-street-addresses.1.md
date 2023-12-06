---
layout: page
title: Docs - Man Pages - ronin-db-street-addresses
---

## NAME

ronin-db-street-addresses - Queries street addresses in the database

## SYNOPSIS

`ronin-db street-addresses` [*options*]

## DESCRIPTION

Queries StreetAddresses.

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

`-P`, `--for-person` *FULL_NAME*
: Searches for street addresses associated with the person's full name.

`-O`, `--for-organization` *NAME*
: Searches for street addresses associated with the organization's name.

`-a`, `--with-address` *ADDRESS*
: Searches for street addresses with the matching address.

`-c`, `--with-city` *CITY*
: Searches for street addresses with the matching city.

`-s`, `--with-state` *STATE*
: Searches for street addresses with the matching state.

`-C`, `--with-country` *COUNTRY*
: Searches for street addresses with the matching country.

`-z`, `--with-zipcode` *ZIPCODE*
: Searches for street addresses with the matching zipcode.

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


