---
layout: page
title: Docs - Man Pages - ronin-masscan-convert
---

## NAME

ronin-masscan-convert - Converts an masscan scan file to JSON or CSV

## SYNOPSIS

`ronin-masscan convert` [`--format` `json`\|`csv`] *INPUT_FILE* [*OUTPUT_FILE*]

## DESCRIPTION

Converts an masscan scan file to JSON or CSV.

## ARGUMENTS

*INPUT_FILE*
: The masscan scan file to import.

*OUTPUT_FILE*
: The optional output file to write to.

## OPTIONS

`-I`, `--input-format` `binary`\|`list`\|`json`\|`ndjson`
: Specifies the format of the *INPUT_FILE*. If not specified the input format
  will be inferred from the *INPUT_FILE* file extension.

`-F`, `--format` `json`|`csv`
: Sets the output conversion format to JSON or CSV. If the option is not given,
  the output conversion format Will be inferred from the *OUTPUT_FILE* file
  extension.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>


