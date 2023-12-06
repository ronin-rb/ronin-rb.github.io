---
layout: page
title: Docs - Man Pages - ronin-db-passwords
---

## NAME

ronin-db-passwords - Manages all passwords in the database

## SYNOPSIS

`ronin-db passwords` [*options*]

## DESCRIPTION

Manages passwords.

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

`--add` *PASSWORD*
: Adds the *PASSWORD* to the database.

`--import` *FILE*
: Imports the Passwords from the given *FILE*.

`--delete` *VALUE*
: Deletes a Password value from the database.

`--delete-all`
: Deletes every Password from the database.

`-u`, `--for-user` *USER*
: Searches for Passwords associated with the user name.

`-e`, `--with-email` *EMAIL*
: Searches for Passwords that are associated with the email address.

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


