---
layout: page
title: Docs - Man Pages - ronin-db-phone-numbers
---

## NAME

ronin-db-phone-numbers - Manages phone numbers in the database

## SYNOPSIS

`ronin-db phone-numbers` [*options*]

## DESCRIPTION

Manages PhoneNumbers.

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
: Adds the phone number to the database.

`--import` *FILE*
: Imports the phone numbers from the given *FILE*.

`--delete` *VALUE*
: Deletes the phone number from the database.

`--delete-all`
: Deletes every phone number from the database.

`-P`, `--for-person` *FULL_NAME*
: Searches for phone numbers associated with the person's full name.

`-O`, `--for-organization` *NAME*
: Searches for phone numbers associated with the organization's name.

`-c`, `--with-country-code` *NUM*
: Searches for phone numbers with the matching 1-3 digit country code.

`-a`, `--with-area-code` *NUM*
: Searches for phone numbers with the matching 3 digit area code.

`-p`, `--with-prefix` *NUM*
: Searches for phone numbers with the matching 3 digit prefix number.

`-l`, `--with-line-number` *NUM*
: Searches for phone numbers with the matching 4 digit line number.

`-S`, `--similar-to` *PHONE_NUMBER*
: Searches for phone numbers that are similar to the given *PHONE_NUMBER*.

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


