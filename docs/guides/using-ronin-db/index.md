---
layout: page
title: Docs - Using ronin-db
---

# Docs - Using ronin-db

[ronin-db] provides access to a built-in pre-configured database for storing
common security data. Using [ronin-db][ronin-db-synopsis] you can query and
manage:

* security advisories
* ASNs
* MAC addresses
* IP addresses
* host names
* port numbers
* service names
* open ports
* software names and versions
* OS guesses
* user names
* email addresses
* URLs
* HTTP requests and responses
* passwords
* credentials (username + password)

## Adding Values

Many of the [ronin-db][ronin-db-synopsis] sub-commands that support querying the
database tables also provide an `--add` option which parses and adds a single
value to the table.

```shell
ronin-db ips --add 192.168.1.1

ronin-db hosts --add www.example.com

ronin-db urls --add "https://www.example.com/page?id=1"

ronin-db emails --add john.smith@example.com

ronin-db creds --add jsmith:s3r3t
```

## Importing Data

Many of the [ronin-db][ronin-db-synopsis] sub-commands that support querying the
database tables also provide an `--import` option, that will parse and import
each line of a `.txt` file.

```shell
ronin-db ips --import targets.txt

ronin-db hosts --import hosts.txt

ronin-db urls --import urls.txt

ronin-db emails --import emails.txt

ronin-db creds --import usernames_and_passwords.txt
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
The `ronin-db asn` command provides an `--update` option which will download
or update the ASN list file and populates the Ronin ASNs table.
  </div>
</article>

## Querying Data

[ronin-db][ronin-db-synopsis] provides sub-commands for querying the various
database tables.

```shell
ronin-db ips --with-port 80

ronin-db hosts --domain example.com

ronin-db email --with-host example.com

ronin-db urls --with-query-param id

ronin-db creds --for-user bob
```

See the command's `--help` output for a complete list of their options.

## Deleting Values

Many of the [ronin-db][ronin-db-synopsis] sub-commands also provide a `--delete`
option for deleting a specific value.

```shell
ronin-db ips --delete 192.168.1.1

ronin-db hosts --delete www.example.com

ronin-db urls --delete "https://www.example.com/page?id=1"

ronin-db emails --delete john.smith@example.com

ronin-db creds --delete jsmith:s3r3t
```

These [ronin-db][ronin-db-synopsis] sub-commands also provide a `--delete-all`
option which deletes *every* value.

## Multiple Databases

Other pre-existing databases can be added to the
`~/.config/ronin-db/database.yml` configuration file.

```$shell
# Add a sqlite3 database
ronin-db add other_db --sqlite3 path/to/db.sqlite3

# Add a postgres database
ronin-db add other_db --postgres --host example.com --port 5432 --username ronin --password s3r3t --database ronin_db

# Add a MySQL database
ronin-db add other_db --mysql2 --host example.com --port 3306 --username ronin --password s3r3t --database ronin_db
```

Once a database is added to the `~/.config/ronin-db/database.yml` configuration
file, it can be accessed by the other [ronin-db][ronin-db-synopsis] sub-commands
by specifying the `--db NAME` option.

```shell
ronin-db ips --db other_db
```

Databases can be listed using the `ronin-db list` command and removed using
`ronin-db remove` command.

## Migrating the Database

If a new version of [ronin-db-activerecord] is released which changes the
database schema, you can run `ronin-db migrate` to apply any pending database
changes.

```shell
ronin-db migrate
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
`ronin-db` will automatically migrate up new databases when
they are first accessed. However, `ronin-db` will **not** automatically apply
database migrations to a database, but *will* print a warning message that
there are pending migrations. You will have to run `ronin-db migrate`.
  </div>
</article>

<div class="level">
  <div class="level-left">
    <a class="button" href="../using-the-ronin-cli/">
       &laquo; Using the Ronin CLI
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="/docs/#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="../using-ronin-repos/">
       Using ronin-repos &raquo;
    </a>
  </div>
</div>

[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-db-synopsis]: https://github.com/ronin-rb/ronin-db#synopsis
[ronin-db-activerecord]: https://github.com/ronin-rb/ronin-db-activerecord#readme
