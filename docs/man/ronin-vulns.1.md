---
layout: page
title: Docs - Man Pages - ronin-vulns
---

## NAME

ronin-vulns - A library and tool that tests for various web vulnerabilities.

## SYNOPSIS

`ronin-vulns` [*options*] [*COMMAND* [...]]

## DESCRIPTION

Runs a `ronin-vulns` *COMMAND*.

## ARGUMENTS

*COMMAND*
: The `ronin-vulns` command to execute.

## OPTIONS

`-V`, `--version`
: Prints the `ronin-vulns` version and exits.

`-h`, `--help`
: Print help information

## COMMANDS

*command-injection*, *cmdi*
: Scans URL(s) for Command Injection vulnerabilities.

*completion*
: Manages the shell completion rules for `ronin-vulns`.

*help*
: Lists available commands or shows help about a specific command.

*irb*
: Starts an interactive Ruby shell with ronin-vulns loaded.

*lfi*
: Scans URL(s) for Local File Inclusion (LFI) vulnerabilities.

*open-redirect*
: Scans URL(s) for Open Redirect vulnerabilities.

*reflected-xss*, *xss*
: Scans URL(s) for Reflected Cross Site Scripting (XSS) vulnerabilities.

*rfi*
: Scans URL(s) for Remote File Inclusion (RFI) vulnerabilities.

*scan*
: Scans URL(s) for web vulnerabilities.

*sqli*
: Scans URL(s) for SQL injection (SQLi) vulnerabilities.

*ssti*
: Scans URL(s) for Server Side Template Injection (SSTI) vulnerabilities.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-vulns-command-injection](ronin-vulns-command-injection.1.html) [ronin-vulns-completion](ronin-vulns-completion.1.html) [ronin-vulns-lfi](ronin-vulns-lfi.1.html) [ronin-vulns-open-redirect](ronin-vulns-open-redirect.1.html) [ronin-vulns-reflected-xss](ronin-vulns-reflected-xss.1.html) [ronin-vulns-rfi](ronin-vulns-rfi.1.html) [ronin-vulns-scan](ronin-vulns-scan.1.html) [ronin-vulns-sqli](ronin-vulns-sqli.1.html) [ronin-vulns-ssti](ronin-vulns-ssti.1.html) 

