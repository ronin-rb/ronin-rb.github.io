---
layout: page
title: Docs - Man Pages - ronin-nmap-scan
---

## NAME

ronin-nmap-scan - Runs nmap and outputs data as JSON or CSV or imports into the database

## SYNOPSIS

`ronin-nmap scan` [options] `--` *nmap_options* ...

## DESCRIPTION

Runs `nmap` and outputs data as JSON or CSV or imports into the database.

## ARGUMENTS

*nmap_options*
: Additional options for the `nmap` command.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to
  (ex: `postgres://user:password@host/db`).

`--db-file` *PATH*
: The sqlite3 database file to use.

`--sudo`
: Explicitly run `nmap` under `sudo`. If the option is not given, then
  `sudo` will automatically be enabled if the *nmap_options* includes a
  privileged option (ex: `-sS`, `-O`, etc).

`-o`, `--output` *FILE*
: Sets the output file to save the `nmap` scan results to. May be a `.xml`,
  `.json`, or `.csv` file.

`-F`, `--output-format` `xml`|`json`|`csv`
: Explicitly specify the output format to XML, JSON, or CSV. If the option is
  not given, the output format Will be inferred from the `--output` *FILE* file
  extension.

`--import`
: Imports the `nmap` scan results into the Ronin database.

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

    $ ronin-nmap scan -o scan.json -- -sV 192.168.1.1

Service scans `192.168.1.1` and saves the scan results to the Ronin database:

    $ ronin-nmap scan --import -- -sV 192.168.1.1

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>


