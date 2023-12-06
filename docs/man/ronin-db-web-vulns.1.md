---
layout: page
title: Docs - Man Pages - ronin-db-web-vulns
---

## NAME

ronin-db-web-vulns - Manages Web Vulns in the database

## SYNOPSIS

`ronin-db urls` [*options*]

## DESCRIPTION

Manages and queries discovered Web Vulnerabilities in the database.

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

`-t`, `--with-type` `lfi`\|`rfi`\|`sqli`\|`ssti`\|`open-redirect`\|`reflected-xss`\|`command-injection`
: Searches for all web vulnerabilities of the given type.

`-H`, `--for-host` *HOST*
: Searches for web vulnerabilities effecting the host.

`-d`, `--for-domain` *DOMAIN*
: Searches for web vulnerabilities effecting the domain.

`-p`, `--for-path` *PATH*
: Searches for web vulnerabilities effecting the given URL's path.

`-q`, `--with-query-param` *NAME*
: Searches for web vulnerabilities effecting the query param name.

`--with-header-name` *NAME*
: Searches for web vulnerabilities effecting the HTTP header name.

`-c`, `--with-cookie-param` *NAME*
: Searches for web vulnerabilities effecting the cookie param name.

`-f`, `--with-form-param` *NAME*
: Searches for web vulnerabilities effecting the form param name.

`-M`, `--with-request-method` *HTTP_METHOD*
: Searches for all web vulnerabilities with the HTTP request method.

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


