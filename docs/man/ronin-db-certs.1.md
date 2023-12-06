---
layout: page
title: Docs - Man Pages - ronin-db-certs
---

## NAME

ronin-db-certs - Queries or imports SSL/TLS certificates

## SYNOPSIS

`ronin-db certs` [*options*]

## DESCRIPTION

Queries or imports SSL/TLS certificates into the database.

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

`-A`, `--active`
: Searches for all Certs that are still valid.

`-E`, `--expired`
: Searches for all Certs that are expired.

`--issuer-common-name` *NAME*
: Searches for all Certs with the Issuer Common Name (CN).

`--issuer-organization` *NAME*
: Searches for all Certs with the Issuer Organization (O).

`--issuer-organizational-unit` *NAME*
: Searches for all Certs with the Issuer Organizational Unit (OU).

`--issuer-locality` *LOCALITY*
: Searches for all Certs with the Issuer Locality (L).

`--issuer-state` *STATE*
: Searches for all Certs with the Issuer State (ST).

`--issuer-country` *COUNTRY*
: Searches for all Certs with the Issuer Country (C).

`--common-name` *HOST*
: Searches for all Certs with the Subject Common Name (CN).

`--subject-alt-name` *HOST*
: Searches for all Certs with the Subject Alternative Name (SAN).

`--organization` *NAME*
: Searches for all Certs with the Subject Organization (O).

`--organizational-unit` *NAME*
: Searches for all Certs with the Subject Organizational Unit (OU).

`--locality` *LOCALITY*
: Searches for all Certs with the Subject Locality (L).

`--state` *STATE*
: Searches for all Certs with the Subject State (ST).

`--country` *COUNTRY*
: Searches for all Certs with the Subject Country (C).

`--import` *FILE*
: Imports a SSL/TLS certificate from a PEM encoded file.

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


