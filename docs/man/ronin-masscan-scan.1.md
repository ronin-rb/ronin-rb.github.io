---
layout: page
title: Docs - Man Pages - ronin-masscan-scan
---

## NAME

ronin-masscan-scan - Runs masscan and outputs data as JSON or CSV or imports into the database

## SYNOPSIS

`ronin-masscan scan` [options] `--` *masscan_options* ...

## DESCRIPTION

Runs `masscan` and outputs data as JSON or CSV or imports into the database.

## ARGUMENTS

*masscan_options*
: Additional options for the `masscan` command.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to
  (ex: `postgres://user:password@host/db`).

`--db-file` *PATH*
: The sqlite3 database file to use.

`--sudo`
: Explicitly run `masscan` under `sudo`. If the option is not given, then
  `sudo` will automatically be enabled if the *masscan_options* includes a
  privileged option (ex: `-sS`, `-O`, etc).

`-o`, `--output` *FILE*
: Sets the output file to save the `masscan` scan results to. May be a `.xml`,
  `.json`, or `.csv` file.

`-F`, `--output-format` `json`|`csv`
: Explicitly specify the output format to JSON or CSV. If the option is
  not given, the output format Will be inferred from the `--output` *FILE* file
  extension.

`--import`
: Imports the `masscan` scan results into the Ronin database.

`-h`, `--help`
: Print help information

## ENVIRONMENT

*HOME*
: The user's home directory.

*XDG_CONFIG_HOME*
: Alternate location for the `~/.config` directory.

*XDG_DATA_HOME*
: Alternate location for the `~/.local/share` directory.

## FILES

`~/.local/share/ronin-db/database.sqlite3`
: The default sqlite3 database file.

`~/.config/ronin-db/database.yml`
: Optional database configuration.

## EXAMPLES

Port scans `192.168.1.1` and save the scan results to a JSON file:

    $ ronin-masscan scan -o scan.json -- 192.168.1.1 -p80,443,...

Service scans `192.168.1.1` and saves the scan results to the Ronin database:

    $ ronin-masscan scan --import -- 192.168.1.1 -p80,443,...

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>


