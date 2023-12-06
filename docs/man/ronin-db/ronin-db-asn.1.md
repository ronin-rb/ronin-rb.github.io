---
layout: page
title: Docs - Man Pages - ronin-db-asn
---

## NAME

ronin-db-asn - Queries and updates ASNs

## SYNOPSIS

`ronin-db asn` [*options*]

## DESCRIPTION

Queries or updates Autonomous System Numbers (ASNs) in the database.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The explicit database URI to connect to.

  * **sqlite3**: `sqlite3:relative/path.db` or `sqlite3:///absolute/path.db`
  * **mysql**: `mysql://user:password@host/database`
  * **postgres**: `postgres://user:password@host/database`

`--db-file` *PATH*
: The sqlite3 database file to use.

`-v`, `--verbose`
: Enables verbose output

`-n`, `--number` *INT*
: Searches for all ASN records with the AS number.

`-C`, `--country-code` *XX*\|`None`\|`Unknown`
: Searches for all ASN records with the country code.

`-N`, `--name` *NAME*
: Searches for all ASN records with the matching name.

`--named` *NAME*
: Searches for all ASN records containing the name.

`-I`, `--ip` *IP*
: Queries the ASN record for the IP.

`-4`, `--ipv4`
: Filter ASN records for only IPv4 ranges.

`-6`, `--ipv6`
: Filter ASN records for only IPv6 ranges.

`-u`, `--update`
: Updates the ASN records.

`-U`, `--url` *URI*
: Overrides the default ASN list URL.
  Defaults to `https://iptoasn.com/data/ip2asn-combined.tsv.gz` if not given.

`-f`, `--file` *FILE*
: Overrides the default ASN list file.
  Defaults to `~/.local/share/ronin/ronin-support/ip2asn-combined.tsv.gz`
  if not given.

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


