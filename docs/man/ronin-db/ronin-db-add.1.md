---
layout: page
title: Docs - Man Pages - ronin-db-add
---

## NAME

ronin-db-add - Adds a pre-existing database to ronin-db

## SYNOPSIS

`ronin-db add` [*options*] *NAME* [*URI*]

## DESCRIPTION

Adds a pre-existing database to the `~/.config/ronin-db/database.yml`
configuration file.

## ARGUMENTS

*NAME*
: The name of the database to add.

*URI*
: The optional URI to the database to add.

## OPTIONS

`-A`, `--adapter` `sqlite3|mysql2|postgres|...`
: The adapter of the database to add.

`--sqlite3` *FILE*
: Alias for `--adapter sqlite3 --database` *FILE*.

`--mysql2`
: Alias for `--adapter mysql2`.

`--postgresql`
: Alias for `--adapter postgresql`.

`-H`, `--host` *HOST*
: The host of the database to add.

`-p`, `--port` *PORT*
: The port of the database to add.

`-u`, `--username` *USER*
: The username to authenticate with for the database.

`-P`, `--password` *PASSWORD*
: The password to authenticate with for the database.

`--read-password`
: Reads the database password from STDIN.

`-D`, `--database` *NAME*|*PATH*
: The database name to connect to. If `--adapter sqlite3` is given then a path
  may be given instead.

`-h`, `--help`
: Print help information.

## EXAMPLES

Add a sqlite3 database file:

    $ ronin-db add other_db --sqlite3 path/to/db.sqlite3

Add a PostgeSQL database:

    $ ronin-db add other_db --postgres --host example.com --port 5432 --username ronin --password s3r3t --database ronin_db

Add a MySQL database:

    $ ronin-db add other_db --mysql2 --host example.com --port 3306 --username ronin --password s3r3t --database ronin_db

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

## SEE ALSO

[ronin-db](ronin-db.1.html) [ronin-db-list](ronin-db-list.1.html) [ronin-db-edit](ronin-db-edit.1.html) [ronin-db-remove](ronin-db-remove.1.html)

