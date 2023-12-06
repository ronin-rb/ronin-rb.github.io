---
layout: page
title: Docs - Man Pages - ronin-payloads-new
---

## NAME

ronin-payloads-new - Creates a new payload file

## SYNOPSIS

`ronin-payloads new` [*options*] *PATH*

## DESCRIPTION

Generates a new payload file.

## ARGUMENTS

*PATH*
: The path to the new payload file to generate.

## OPTIONS

`-t`, `--type` `asm`\|`shellcode`\|`c`\|`go`\|`rust`\|`command`\|`shell`\|`powershell`\|`html`\|`javascript`\|`typescript`\|`java`\|`sql`\|`php`\|`python`\|`ruby`\|`nodejs`
: The type of payload to generate.

`-a`, `--author` *NAME*
: The name of the author. Defaults to the configured git author name or the
  `USERNAME` environment variable.

`-e`, `--author-email` *EMAIL*
: The email address of the author. Defaults to the configured git author email.

`-S`, `--summary` *TEXT*
: The summary text for the new payload.

`-D`, `--description` *TEXT*
: The description text for the new payload.

`-R`, `--reference` *URL*
: Adds a reference URL to the new payload.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-payloads-list](ronin-payloads-list.1.html) [ronin-payloads-show](ronin-payloads-show.1.html) [ronin-payloads-build](ronin-payloads-build.1.html) [ronin-payloads-launch](ronin-payloads-launch.1.html)

