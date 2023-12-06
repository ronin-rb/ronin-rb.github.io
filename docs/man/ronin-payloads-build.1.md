---
layout: page
title: Docs - Man Pages - ronin-payloads-build
---

## NAME

ronin-payloads-build - Loads and builds a payload

## SYNOPSIS

`ronin-payloads build` [*options*] {`--file` *FILE* \| *NAME*}

## DESCRIPTION

Loads and builds a payload.

## ARGUMENTS

*NAME*
: The name of the payload to load.

## OPTIONS

`-f`, `--file` *FILE*
: Optionally loads the payload from the file.

`-F`, `--format` `hex`\|`c`\|`shell`\|`powershell`\|`xml`\|`html`\|`js`\|`ruby`
: Formats the built payload for another programming language.

`-p`, `--param` *NAME*`=`*VALUE*
: Sets a param for the payload.

`-o`, `--output` *FILE*
: Writes the built payload to the given file instead of printing it to stdout.

`-E`, `--encoder` *ENCODER*
: Adds the encoder to the payload's encoder pipeline.

`--encoder-param` *ENCODER*`.`*NAME*`.`*VALUE*
: Sets a param on the given encoder.

`-D`, `--debug`
: Enables debugging messages.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-payloads-list](ronin-payloads-list.1.html) [ronin-payloads-show](ronin-payloads-show.1.html) [ronin-payloads-launch](ronin-payloads-launch.1.html)

