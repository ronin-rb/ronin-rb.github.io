---
layout: page
title: Docs - Man Pages - ronin-db-remove
---

## NAME

ronin-db-remove - Removes a database from the configuration file

## SYNOPSIS

`ronin-db remove` [*options*] *NAME*

## DESCRIPTION

Removes a database entry from the `~/.config/ronin-db/database.yml`
configuration file.

## ARGUMENTS

*NAME*
: The database entry to remove.

## OPTIONS

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

## SEE ALSO

[ronin-db](ronin-db.1.html) [ronin-db-add](ronin-db-add.1.html) [ronin-db-list](ronin-db-list.1.html) [ronin-db-edit](ronin-db-edit.1.html)

