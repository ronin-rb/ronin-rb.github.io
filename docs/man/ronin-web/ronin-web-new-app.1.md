---
layout: page
title: Docs - Man Pages - ronin-web-new-app
---

## SYNOPSIS

`ronin-web new app` [*options*] [*DIR*]

## DESCRIPTION

Generates a new `ronin-web-server` based web app.

## ARGUMENTS

*DIR*
: The project directory to create.

## OPTIONS

`--port` *PORT*
: The port the app will listen on by default. Defaults to `3000`.

`--ruby-version` *VERSION*
: The desired ruby version for the project Defaults to the current ruby version.

`--git`
: Initializes a git repo.

`-D`, `--dockerfile`
: Adds a `Dockerfile` and a `docker-compose.yml` file to the new project.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-web-new-nokogiri](ronin-web-new-nokogiri.1.html) [ronin-web-new-server](ronin-web-new-server.1.html) [ronin-web-new-spider](ronin-web-new-spider.1.html)
