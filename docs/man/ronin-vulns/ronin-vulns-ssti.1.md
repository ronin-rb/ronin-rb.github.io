---
layout: page
title: Docs - Man Pages - ronin-vulns-ssti
---

## NAME

ronin-vulns-ssti - Scans URL(s) for Server Side Template Injection (SSTI) vulnerabilities

## SYNOPSIS

`ronin-vulns lfi` [*options*] {*URL* ... \| `--input` *FILE*}

## DESCRIPTION

Scans URL(s) for Server Side Template Injection (SSTI) vulnerabilities. The URLs
to scan can be given as additional arguments or read from a file using the
`--input` option.

## ARGUMENTS

*URL*
: A URL to scan.

## OPTIONS

`--db` *NAME*
: The database name to connect to. Defaults to `default` if not given.

`--db-uri` *URI*
: The database URI to connect to
  (ex: `postgres://user:password@host/db`).

`--db-file` *PATH*
: The sqlite3 database file to use.

`--import`
: Imports discovered vulnerabilities into the database.

`--first`
: Only find the first vulnerability for each URL.

`-A`, `--all`
: Find all vulnerabilities for each URL.

`--print-curl`
: Also prints an example `curl` command for each vulnerability.

`--print-http`
: Also prints an example HTTP request for each vulnerability.

`-M`, `--request-method` `COPY`|`DELETE`|`GET`|`HEAD`|`LOCK`|`MKCOL`|`MOVE`|`OPTIONS`|`PATCH`|`POST`|`PROPFIND`|`PROPPATCH`|`PUT`|`TRACE`|`UNLOCK`
: Sets the HTTP request method to use.

`-H`, `--header` "*Name*: *value*"
: Sets an additional header using the given *Name* and *value*.

`-U`, `--user-agent-string` *STRING*
: Sets the `User-Agent` header string.

`-u`, `--user-agent` `chrome-linux`\|`chrome-macos`\|`chrome-windows`\|`chrome-iphone`\|`chrome-ipad`\|`chrome-android`\|`firefox-linux`\|`firefox-macos`\|`firefox-windows`\|`firefox-iphone`\|`firefox-ipad`\|`firefox-android`\|`safari-macos`\|`safari-iphone`\|`safari-ipad`\|`edge`
: Sets the `User-Agent` header.

`-C`, `--cookie` *COOKIE*
: Sets the raw `Cookie` header.

`-c`, `--cookie-param` *NAME*`=`*VALUE*
: Sets an additional `Cookie` param using the given *NAME* and *VALUE*.

`-R`, `--referer` *URL*
: Sets the `Referer` header.

`-F`, `--form-param` *NAME*`=`*VALUE*
: Sets an additional form param using the given *NAME* and *VALUE*.

`--test-query-param` *NAME*
: Tests the URL query param name.

`--test-all-query-params`
: Test all URL query param names.

`--test-header-name` *NAME*
: Tests the HTTP Header name.

`--test-cookie-param` *NAME*
: Tests the HTTP Cookie name.

`--test-all-cookie-params`
: Test all Cookie param names.

`--test-form-param` *NAME*
: Tests the form param name.

`-i`, `--input` *FILE*
: Reads URLs from the given *FILE*.

`-T`, `--test-expr` {*X\*Y* \| *X/Z* \| *X+Y* \| *X-Y*}
: Optional numeric test to use.

`-h`, `--help`
: Print help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-vulns-scan](ronin-vulns-scan.1.html)
