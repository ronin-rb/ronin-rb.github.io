---
layout: page
title: Docs - Man Pages - ronin-db-urls
---

## NAME

ronin-db-urls - Manages URLs

## SYNOPSIS

`ronin-db urls` [*options*]

## DESCRIPTION

Manages URLs.

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

`--http`
: Searches for `http://` URLs.

`--https`
: Searches for `https://` URLs.

`-H`, `--host` *HOST*
: Searches for URLs with the given *HOST*.

`-p`, `--with-port` *PORT*
: Searches for URLs associated with the *PORT*.

`-d`, `--directory` *DIRECTORY*
: Searches for URLs sharing the DIRECTORY.

`-q`, `--with-query-param` *NAME* [...]
: Searches for URLs containing the query-param NAME.

`-Q`, `--with-query-value` *VALUE* [...]
: Searches for URLs containing the query-param VALUE.

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


