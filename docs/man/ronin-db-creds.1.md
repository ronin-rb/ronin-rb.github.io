---
layout: page
title: Docs - Man Pages - ronin-db-creds
---

## NAME

ronin-db-creds - Manages all credentials in the database

## SYNOPSIS

`ronin-db creds` [*options*]

## DESCRIPTION

Manages credentials.

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

`--add` *USER*:*PASSWORD*
: Adds the *USER* and *PASSWORD* to the database.

`--import` *FILE*
: Imports the credentials from the given *FILE*.

`--delete` *VALUE*
: Deletes a credential value from the database.

`--delete-all`
: Deletes every credential from the database.

`-u`, `--for-user` *USER*
: Searches for credentials associated with the *USER*.

`-p`, `--with-password` *PASSWORD*
: Searches for credentials that have the *PASSWORD*.

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


