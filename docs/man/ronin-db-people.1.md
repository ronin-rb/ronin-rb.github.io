---
layout: page
title: Docs - Man Pages - ronin-db-people
---

## NAME

ronin-db-people - Queries people in the database

## SYNOPSIS

`ronin-db people` [*options*]

## DESCRIPTION

Queries people.

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

`-a`, `--for-address` *ADDRESS*
: Searches for all People associated with the street address.

`-c`, `--for-city` *CITY*
: Searches for all People associated with the city.

`-s`, `--for-state` *STATE*
: Searches for all People associated with the State.

`-p`, `--for-province` *PROVINCE*
: Searches for all People associated with the Province.

`-z`, `--for-zipcode` *ZIPCODE*
: Searches for all People associated with the zipcode.

`-C`, `--for-country` *COUNTRY*
: Searches for all People associated with the Country.

`-P`, `--with-prefix` *PREIFX*
: Searches for all People with the given prefix.

`-f`, `--with-first-name` *NAME*
: Searches for all People with the first name.

`-m`, `--with-middle-name` *NAME*
: Searches for all People with the middle name.

`-M`, `--with-middle-initial` *INITIAL*
: Searches for all People with the middle name.

`-l`, `--with-last-name` *NAME*
: Searches for all People with the last name.

`-S`, `--with-suffix` *SUFFIX*
: Searches for all People with the given suffix.

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


