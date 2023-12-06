---
layout: page
title: Docs - Man Pages - ronin-payloads-encode
---

## NAME

ronin-payloads-encode - Encodes data using the encoder(s)

## SYNOPSIS

`ronin-payloads encoder` [*options*] {`--string` *STRING* \| *FILE*}

## DESCRIPTION

Encodes data using one or more encoders.

## ARGUMENTS

*FILE*
: The optional file to read the data to encode from.

## OPTIONS

`-F`, `--format` `hex`\|`c`\|`shell`\|`powershell`\|`xml`\|`html`\|`js`\|`ruby`
: Formats the encoded data.

`-E`, `--encoder` *ENCODER*
: Loads the encoder with the given name.

`-p`, `--param` *ENCODER*`.`*NAME*`=`*VALUE*
: Sets a param on one of the loaded encoders.

`-s`, `--string` *STRING*
: Encodes the given string.

`-h`, `--help`
: Print help information

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-payloads-encoders](ronin-payloads-encoders.1.html) [ronin-payloads-encoder](ronin-payloads-encoder.1.html)

