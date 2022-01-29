---
layout: post
title: Announcing The Big Refactor
author: postmodern
tags:
 - refactor
 - ronin-support
 - ronin-core
 - ronin-repos
 - ronin-db
 - ronin-gen
 - ronin-asm
 - ronin-sql
 - ronin-web-server
 - ronin-web-spider
 - ronin-web-user_agents
 - ronin-web
 - ronin-vuln-lfi
 - ronin-vuln-rfi
 - ronin-post_ex
 - ronin-c2
 - ronin-agent-node
 - ronin-agent-php
 - ronin-agent-ruby
 - ronin-payloads
 - ronin-exploits
 - ronin
---

After letting Ronin sit for sometime without adding new features or releasing
new versions, I decided it was time for a Big Refactor. There is still a lot of
useful features and code in Ronin, the code just needs to be brought up to date
and those features be better exposed to end-user. A refactor and re-organization
will also allow for the rapid development of newer ronin libraries and tools.

## High-Level Plan

* Bring repositories up to date with current Ruby best practices.
  * [x] Require ruby >= 2.7.0.
  * [ ] Set `.ruby-version` to `ruby-3.0` (WIP).
  * [ ] Use keyword arguments (WIP).
  * [ ] Rename all `extensions/` directories to `core_ext/` (WIP).
  * [x] Replace TravisCI with [GitHub Actions].
  * [x] Rename `master` branches to `main`.
  * [x] Add a `CONTRIBUTING.md` file.
  * [ ] Setup [rubocop] style checker (pending).
  * [ ] Opt-in to [rubygems.org MFA requirement] \(WIP\).
* [x] Split larger libraries apart into smaller more manageable libraries.
  - Tier 1: ronin gems that only provide commands (ex: the main [ronin] gem).
  - Tier 2: `ronin-*` gems that also contain commands and some library code
    (ex: [ronin-db]).
  - Tier 3: `ronin-*` gems that only contain library code (ex:
    `ronin-web-server`).
* [x] Change the licenses of all libraries from GPLv3 to LGPLv3; excluding
      Tier 1 libraries.
* [ ] Avoid excessive meta-programming in favor of simple Plain-Old-Ruby-Objects
     (PORO).
* [ ] Add more commands to each `ronin-` library to better expose the APIs for
  non-Ruby-programmers.
* [ ] Standardize on using the [command_kit] gem for all things CLI (WIP).
* [ ] Store all user data and configuration in [XDG directories] \(`~/.config/`,
  `~/.cache/`, `~/.local/share/`\) (WIP).
* [x] Create a [ronin-core] library for reusable internal library code.
* [x] Create a [ronin-repos] library for handling 3rd-party Git repositories of
     additional code and data.
* [x] Extract database models from [ronin] into [ronin-db]. Refactor to use
      [ActiveRecord].
* [x] Extract and refactor [ronin-web-server], [ronin-web-spider], and
      [ronin-web-user_agents] libraries from [ronin-web].
* [x] Extract and refactor [ronin-vuln-lfi] and [ronin-vuln-rfi] from the old
      [ronin-php] library.
* [x] Extract and refactor [ronin-payloads], [ronin-post_ex],
      [ronin-agent-node], [ronin-agent-php], and [ronin-agent-ruby], libraries
      from [ronin-exploits].
* [ ] Create a [ronin-c2] library for communicating with various agents and
      payloads.
* [x] Deprecate the `ronin-gen` gem and command, in favor of adding a `gen` or
      `new` subcommand for generating new boilerplate files or directories.

[command_kit]: https://github.com/postmodern/command_kit.rb#readme
[rubocop]: https://github.com/rubocop/rubocop#readme
[GitHub Actions]: https://github.com/features/actions
[jruby]: https://jruby.org/
[truffleruby]: https://github.com/oracle/truffleruby#readme
[rubygems.org MFA requirement]: https://guides.rubygems.org/mfa-requirement-opt-in/
[ActiveRecord]: https://guides.rubyonrails.org/active_record_basics.html
[ronin-php]: https://github.com/ronin-rb/ronin-php

## Libraries

* [ronin-support]({{ page.url }}#ronin-support)
* [ronin-core]({{ page.url }}#ronin-core)
* [ronin-repos]({{ page.url }}#ronin-repos)
* [ronin-db]({{ page.url }}#ronin-db)
* [ronin-asm]({{ page.url }}#ronin-asm)
* [ronin-sql]({{ page.url }}#ronin-sql)
* [ronin-web-server]({{ page.url }}#ronin-web-server)
* [ronin-web-spider]({{ page.url }}#ronin-web-spider)
* [ronin-web-user_agents]({{ page.url }}#ronin-web-user_agents)
* [ronin-web]({{ page.url }}#ronin-web)
* [ronin-vuln-lfi]({{ page.url }}#ronin-vuln-lfi)
* [ronin-vuln-rfi]({{ page.url }}#ronin-vuln-rfi)
* [ronin-post_ex]({{ page.url }}#ronin-post_ex)
* [ronin-c2]({{ page.url }}#ronin-c2)
* [ronin-agent-node]({{ page.url }}#ronin-agent-node)
* [ronin-agent-php]({{ page.url }}#ronin-agent-php)
* [ronin-agent-ruby]({{ page.url }}#ronin-agent-ruby)
* [ronin-payloads]({{ page.url }}#ronin-payloads)
* [ronin-exploits]({{ page.url }}#ronin-exploits)
* [ronin]({{ page.url }}#ronin)

Below are the links to the individual GitHub issues for each library. You will
notice that nearly half of the issues are already checked. That is because they
have already been completed prior to publishing this blog post. We are already
past the half-way mark!

If you want to see what is currently being worked on, checkout the
[GitHub Project Board][Refactor].

If you see any issues that interest you, feel free to comment on the issue
or join our [Discord] server.

[Refactor]: https://github.com/orgs/ronin-rb/projects/2

### [ronin-support](https://github.com/ronin-rb/ronin-support/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-support] is a support library for ronin-rb. ronin-support provides
many Core Extensions to Ruby's built-in classes as well as it's own
Classes/Modules. ronin-support can be used by other Ruby libraries, tools, or
scripts.

**Note:** Development work is currently taking place on the
[1.0.0](https://github.com/ronin-rb/ronin-support/tree/1.0.0) branch.

* [ ] [Add support for a RONIN_HTTP_PROXY env variable][ronin-support#146]
* [ ] [Style the [ ] part as ANSI bold+bright in CLI::Printing#print_\* methods][ronin-support#138]
* [ ] [Remove ANSI coloring from the message in CLI::Printing#print_\* methods?][ronin-support#137]
* [ ] [Add an ANSI reset to the CLI::Printing#print_\* methods][ronin-support#136]
* [ ] [Add print_debug statements to Network methods][ronin-support#130]
* [ ] [Add a Hash of built-in User-Agent strings][ronin-support#125]
* [ ] [Allow the user_agent: keyword argument to accept a Symbol][ronin-support#124]
* [ ] [Add a user_agent: :random option to Network::HTTP methods][ronin-support#123]
* [ ] [Add Ronin::Support::Interactive][ronin-support#121]
* [ ] [Remove data_paths dependency][ronin-support#114]
* [ ] [Add Ronin::IP value-object class][ronin-support#111]
* [ ] [Add Ronin::Host value-object class][ronin-support#110]
* [ ] [Add Ronin::Domain value-object class][ronin-support#109]
* [ ] [Add Ronin::Port value-object class?][ronin-support#108]
* [ ] [Rename ronin/formatting to just ronin/format][ronin-support#107]
* [ ] [Rename ronin/extensions/regexp to ronin/text/patterns][ronin-support#105]
* [ ] [Add Ronin::IP::CIDR][ronin-support#104]
* [ ] [Add a Ronin::IP::Glob class][ronin-support#103]
* [ ] [Refactor Ronin::Templates::Erb to Ronin::Text::ERB][ronin-support#102]
* [ ] [Add support for Base32][ronin-support#101]
* [ ] [Add support for Base64, with a custom table][ronin-support#100]
* [ ] [Add Ronin::Text::Typo][ronin-support#99]
* [ ] [Add bash shell command formatting methods to ronin/formatting][ronin-support#98]
* [ ] [Add helper methods for converting between ASCII and UTF8][ronin-support#97]
* [ ] [Add Ronin::Network::DNS::Resolver][ronin-support#96]
* [ ] [Add dns_record(type, name) method to Ronin::Network::DNS][ronin-support#95]
* [ ] [Add dns_mx(name), dns_cname(name), dns_txt(name), etc methods to Ronin::Network::DNS][ronin-support#94]
* [ ] [Add a basic connect() port scanner method/class to Ronin::Network::TCP][ronin-support#93]
* [ ] [Add a method for generating our own self-signed cert in Ronin::Network::SSL][ronin-support#92]
* [ ] [Allow configuring the ssl_version in Ronin::Network::SSL][ronin-support#91]
* [ ] [Add Ronin::Network::SSL::Server][ronin-support#90]
* [ ] [Add Ronin::Network::TLS][ronin-support#89]
* [ ] [Add Ronin::Network::HTTP::Client class][ronin-support#87]
* [ ] [Refactor http_\* methods to accept a single String or URI argument][ronin-support#86]
* [ ] [Allow http_\* methods to support passing a block to receive each response chunk][ronin-support#85]
* [ ] [Add methods for parsing .key, .pem, or .crt files to Ronin::Crypto][ronin-support#84]
* [ ] [Add 3DES encryption method to Ronin::Crypto][ronin-support#83]
* [ ] [Add AES encryption/decryption methods to Ronin::Crypto][ronin-support#82]
* [ ] [Add RSA encryption/decryption methods to Ronin::Crypto][ronin-support#81]
* [ ] [Add String#rot(n=13) as a joke to Ronin::Crypto][ronin-support#80]
* [ ] [Add a Type system called Ronin::Binary::Types][ronin-support#75]
* [ ] [Add Ronin::Arch namespace][ronin-support#74]

[ronin-support#146]: https://github.com/ronin-rb/ronin-support/issues/146
[ronin-support#138]: https://github.com/ronin-rb/ronin-support/issues/138
[ronin-support#137]: https://github.com/ronin-rb/ronin-support/issues/137
[ronin-support#136]: https://github.com/ronin-rb/ronin-support/issues/136
[ronin-support#130]: https://github.com/ronin-rb/ronin-support/issues/130
[ronin-support#125]: https://github.com/ronin-rb/ronin-support/issues/125
[ronin-support#124]: https://github.com/ronin-rb/ronin-support/issues/124
[ronin-support#123]: https://github.com/ronin-rb/ronin-support/issues/123
[ronin-support#121]: https://github.com/ronin-rb/ronin-support/issues/121
[ronin-support#114]: https://github.com/ronin-rb/ronin-support/issues/114
[ronin-support#111]: https://github.com/ronin-rb/ronin-support/issues/111
[ronin-support#110]: https://github.com/ronin-rb/ronin-support/issues/110
[ronin-support#109]: https://github.com/ronin-rb/ronin-support/issues/109
[ronin-support#108]: https://github.com/ronin-rb/ronin-support/issues/108
[ronin-support#107]: https://github.com/ronin-rb/ronin-support/issues/107
[ronin-support#105]: https://github.com/ronin-rb/ronin-support/issues/105
[ronin-support#104]: https://github.com/ronin-rb/ronin-support/issues/104
[ronin-support#103]: https://github.com/ronin-rb/ronin-support/issues/103
[ronin-support#102]: https://github.com/ronin-rb/ronin-support/issues/102
[ronin-support#101]: https://github.com/ronin-rb/ronin-support/issues/101
[ronin-support#100]: https://github.com/ronin-rb/ronin-support/issues/100
[ronin-support#99]: https://github.com/ronin-rb/ronin-support/issues/99
[ronin-support#98]: https://github.com/ronin-rb/ronin-support/issues/98
[ronin-support#97]: https://github.com/ronin-rb/ronin-support/issues/97
[ronin-support#96]: https://github.com/ronin-rb/ronin-support/issues/96
[ronin-support#95]: https://github.com/ronin-rb/ronin-support/issues/95
[ronin-support#94]: https://github.com/ronin-rb/ronin-support/issues/94
[ronin-support#93]: https://github.com/ronin-rb/ronin-support/issues/93
[ronin-support#92]: https://github.com/ronin-rb/ronin-support/issues/92
[ronin-support#91]: https://github.com/ronin-rb/ronin-support/issues/91
[ronin-support#90]: https://github.com/ronin-rb/ronin-support/issues/90
[ronin-support#89]: https://github.com/ronin-rb/ronin-support/issues/89
[ronin-support#87]: https://github.com/ronin-rb/ronin-support/issues/87
[ronin-support#86]: https://github.com/ronin-rb/ronin-support/issues/86
[ronin-support#85]: https://github.com/ronin-rb/ronin-support/issues/85
[ronin-support#84]: https://github.com/ronin-rb/ronin-support/issues/84
[ronin-support#83]: https://github.com/ronin-rb/ronin-support/issues/83
[ronin-support#82]: https://github.com/ronin-rb/ronin-support/issues/82
[ronin-support#81]: https://github.com/ronin-rb/ronin-support/issues/81
[ronin-support#80]: https://github.com/ronin-rb/ronin-support/issues/80
[ronin-support#75]: https://github.com/ronin-rb/ronin-support/issues/75
[ronin-support#74]: https://github.com/ronin-rb/ronin-support/issues/74

* [x] [Remove ronin/fuzzing.rb and ronin/fuzzing][ronin-support#145]
* [x] [Change HTTP :proxy options to accept a String][ronin-support#144]
* [x] [Upgrade to uri-query_params ~> 0.8][ronin-support#143]
* [x] [Upgrade to hexdump ~> 1.0][ronin-support#142]
* [x] [Remove ronin/extensions/meta and ronin/extensions/meta/object][ronin-support#141]
* [x] [Remove yard-parameters dependency][ronin-support#140]
* [x] [Move yard dependency into the Gemfile][ronin-support#139]
* [x] [Remove CLI::Printing#print_exception][ronin-support#135]
* [x] [Remove the ability to pass format strings to Printing methods][ronin-support#134]
* [x] [Add Printing.debug? and Printing.debug=][ronin-support#133]
* [x] [Remove ronin/spec/cli/printing][ronin-support#132]
* [x] [Remove verbose, normal, quiet, silent modes from CLI::Printing][ronin-support#131]
* [x] [Ruby 3.0 removed net/ftp from stdlib][ronin-support#129]
* [x] [Remove ronin/ui/output][ronin-support#128]
* [x] [Rename ronin/ui/printing to ronin/support/cli/printing][ronin-support#127]
* [x] [Remove Ronin::Mixin][ronin-support#126]
* [x] [Remove Ronin::UI::REPL and Ronin::UI::Shell][ronin-support#122]
* [x] [Add support for truffleruby][ronin-support#120]
* [x] [Move all files into the ronin/support/ directory][ronin-support#119]
* [x] [Rename extensions/ to core_ext/][ronin-support#118]
* [x] [Remove Ronin::Network::Mixins][ronin-support#117]
* [x] [Remove Mixin API][ronin-support#116]
* [x] [Remove parameters dependency][ronin-support#115]
* [x] [Remove ronin/network/http/proxy (Ronin::Network::HTTP::Proxy)][ronin-support#88]
* [x] [Add an ANSI module to Ronin::CLI][ronin-support#77]
* [x] [Remove Ronin::Wordlist][ronin-support#73]
* [x] [Extract ronin/fuzzing from ronin-support][ronin-support#72]

[ronin-support#145]: https://github.com/ronin-rb/ronin-support/issues/145
[ronin-support#144]: https://github.com/ronin-rb/ronin-support/issues/144
[ronin-support#143]: https://github.com/ronin-rb/ronin-support/issues/143
[ronin-support#142]: https://github.com/ronin-rb/ronin-support/issues/142
[ronin-support#141]: https://github.com/ronin-rb/ronin-support/issues/141
[ronin-support#140]: https://github.com/ronin-rb/ronin-support/issues/140
[ronin-support#139]: https://github.com/ronin-rb/ronin-support/issues/139
[ronin-support#135]: https://github.com/ronin-rb/ronin-support/issues/135
[ronin-support#134]: https://github.com/ronin-rb/ronin-support/issues/134
[ronin-support#133]: https://github.com/ronin-rb/ronin-support/issues/133
[ronin-support#132]: https://github.com/ronin-rb/ronin-support/issues/132
[ronin-support#131]: https://github.com/ronin-rb/ronin-support/issues/131
[ronin-support#129]: https://github.com/ronin-rb/ronin-support/issues/129
[ronin-support#128]: https://github.com/ronin-rb/ronin-support/issues/128
[ronin-support#127]: https://github.com/ronin-rb/ronin-support/issues/127
[ronin-support#126]: https://github.com/ronin-rb/ronin-support/issues/126
[ronin-support#122]: https://github.com/ronin-rb/ronin-support/issues/122
[ronin-support#120]: https://github.com/ronin-rb/ronin-support/issues/120
[ronin-support#119]: https://github.com/ronin-rb/ronin-support/issues/119
[ronin-support#118]: https://github.com/ronin-rb/ronin-support/issues/118
[ronin-support#117]: https://github.com/ronin-rb/ronin-support/issues/117
[ronin-support#116]: https://github.com/ronin-rb/ronin-support/issues/116
[ronin-support#115]: https://github.com/ronin-rb/ronin-support/issues/115
[ronin-support#88]: https://github.com/ronin-rb/ronin-support/issues/88
[ronin-support#77]: https://github.com/ronin-rb/ronin-support/issues/77
[ronin-support#73]: https://github.com/ronin-rb/ronin-support/issues/73
[ronin-support#72]: https://github.com/ronin-rb/ronin-support/issues/72

### [ronin-core](https://github.com/ronin-rb/ronin-core/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-core] is a core library providing common functionality for all ronin
libraries.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-core/tree/main) branch.

* [ ] [Add Ronin::Core::Metadata::References][ronin-core#23]
* [ ] [Add Ronin::Core::Metadata::Author][ronin-core#22]
* [ ] [Add Ronin::Core::Metadata::Summary][ronin-core#21]
* [ ] [Add Ronin::Core::Metadata::Description][ronin-core#20]
* [ ] [Support reading multi-line input in Ronin::Core::CLI::Shell.start][ronin-core#19]
* [ ] [Add a Ronin::Core::CLI::TipCommand base class][ronin-core#14]
* [ ] [Add a TipFile class for parsing tips.yml files][ronin-core#13]
* [ ] [Add a Module Registry API][ronin-core#9]

[ronin-core#23]: https://github.com/ronin-rb/ronin-core/issues/23
[ronin-core#22]: https://github.com/ronin-rb/ronin-core/issues/22
[ronin-core#21]: https://github.com/ronin-rb/ronin-core/issues/21
[ronin-core#20]: https://github.com/ronin-rb/ronin-core/issues/20
[ronin-core#19]: https://github.com/ronin-rb/ronin-core/issues/19
[ronin-core#14]: https://github.com/ronin-rb/ronin-core/issues/14
[ronin-core#13]: https://github.com/ronin-rb/ronin-core/issues/13
[ronin-core#9]: https://github.com/ronin-rb/ronin-core/issues/9

* [x] [Add the ability of defining shell commands that have different method names than the command name][ronin-core#17]
* [x] [Add a sigil variable to Ronin::Core::CLI::Shell][ronin-core#16]
* [x] [Split Ronin::Core::CLI::Shell into Shell and CommandShell][ronin-core#15]
* [x] [Add tab-completion support to Ronin::Core::CLI::Shell][ronin-core#12]
* [x] [Add ANSI styling to the Ronin::Core::Shell prompt][ronin-core#7]
* [x] [Add ANSI styling to the Ronin::Core::Console prompt][ronin-core#6]
* [x] [Add Ronin::Core::Console using the new irb gem][ronin-core#3]
* [x] [Add more professional looking \>\>\> message, \*\*\* warning, !!! error ANSI colored logging methods][ronin-core#4]
* [x] [Add Ronin::Core::Shell][ronin-core#5]

[ronin-core#17]: https://github.com/ronin-rb/ronin-core/issues/17
[ronin-core#16]: https://github.com/ronin-rb/ronin-core/issues/16
[ronin-core#15]: https://github.com/ronin-rb/ronin-core/issues/15
[ronin-core#12]: https://github.com/ronin-rb/ronin-core/issues/12
[ronin-core#7]: https://github.com/ronin-rb/ronin-core/issues/7
[ronin-core#6]: https://github.com/ronin-rb/ronin-core/issues/6
[ronin-core#3]: https://github.com/ronin-rb/ronin-core/issues/3
[ronin-core#4]: https://github.com/ronin-rb/ronin-core/issues/4
[ronin-core#5]: https://github.com/ronin-rb/ronin-core/issues/5

### [ronin-repos](https://github.com/ronin-rb/ronin-repos/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-repos] provides a repository system for installing, managing, and
accessing third-party git repositories, which can contain code or other data.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-repos/tree/main) branch.

* [ ] [Add methods to allow requiring a single file from a repository][ronin-repos#8]
* [ ] [Prefix all git methods in Repository with git_][ronin-repos#7]
* [ ] [Add a Repository#has_directory? method][ronin-repos#6]
* [ ] [Add Repository#has_file? method][ronin-repos#5]
* [ ] [Add the ability of detecting a Gemfile and running bundle install][ronin-repos#4]
* [ ] [Add an exec subcommand to ronin-repos][ronin-repos#3]

[ronin-repos#8]: https://github.com/ronin-rb/ronin-repos/issues/8
[ronin-repos#7]: https://github.com/ronin-rb/ronin-repos/issues/7
[ronin-repos#6]: https://github.com/ronin-rb/ronin-repos/issues/6
[ronin-repos#5]: https://github.com/ronin-rb/ronin-repos/issues/5
[ronin-repos#4]: https://github.com/ronin-rb/ronin-repos/issues/4
[ronin-repos#3]: https://github.com/ronin-rb/ronin-repos/issues/3

### [ronin-db](https://github.com/ronin-rb/ronin-db/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-db] is a database library for managing and querying security data.
ronin-db provides common ORM models for interacting with the database's SQL
tables and querying/storing security data, such as URLs, email addresses,
host names, IPs, ports, etc. ronin-db also provides CLI commands for managing
the database(s).

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-db/tree/main) branch.

* [ ] [Convert option={} to keyword arguments][ronin-db#13]
* [ ] [Refactor Ronin::DB::CLI::Commands to use Ronin::Core::CLI::Command][ronin-db#8]
* [ ] [Add truffleruby to the CI][ronin-db#6]
* [ ] [Refactor ronin-db to use ActiveRecord][ronin-db#3]
* [ ] [Add models for storing Headers and form data in Ronin's Database][ronin-db#15]
* [ ] [Add flavor property to OS][ronin-db#4]

[ronin-db#13]: https://github.com/ronin-rb/ronin-db/issues/13
[ronin-db#8]: https://github.com/ronin-rb/ronin-db/issues/8
[ronin-db#6]: https://github.com/ronin-rb/ronin-db/issues/6
[ronin-db#3]: https://github.com/ronin-rb/ronin-db/issues/3
[ronin-db#15]: https://github.com/ronin-rb/ronin-db/issues/15
[ronin-db#4]: https://github.com/ronin-rb/ronin-db/issues/4

* [x] [Add Ronin::DB::CLI::Command base class][ronin-db#21]
* [x] [Remove bin/ronin-\* files in favor of ronin-db subcommands][ronin-db#20]
* [x] [Update required_ruby_version to >= 2.7.0][ronin-db#19]
* [x] [Move all ruby files into the lib/ronin/db/ directory][ronin-db#18]
* [x] [Remove dm-visualizer and ruby-graphviz from the Gemfile][ronin-db#17]
* [x] [Remove yard-dm dependency][ronin-db#16]
* [x] [Change license to LGPL-3.0][ronin-db#14]
* [x] [Remove all DataMapper code/dependencies from the Gemfile][ronin-db#12]
* [x] [Remove all dm-\* dependencies][ronin-db#11]
* [x] [Refactor Ronin::DB::CLI to be a main command class CLI][ronin-db#10]
* [x] [Rename ronin/ui/cli/Ronin::UI::CLI to ronin/db/cli/Ronin::DB::CLI][ronin-db#9]
* [x] [Add ronin-core dependency][ronin-db#7]
* [x] [Add GitHub CI][ronin-db#5]

[ronin-db#21]: https://github.com/ronin-rb/ronin-db/issues/21
[ronin-db#20]: https://github.com/ronin-rb/ronin-db/issues/20
[ronin-db#19]: https://github.com/ronin-rb/ronin-db/issues/19
[ronin-db#18]: https://github.com/ronin-rb/ronin-db/issues/18
[ronin-db#17]: https://github.com/ronin-rb/ronin-db/issues/17
[ronin-db#16]: https://github.com/ronin-rb/ronin-db/issues/16
[ronin-db#14]: https://github.com/ronin-rb/ronin-db/issues/14
[ronin-db#12]: https://github.com/ronin-rb/ronin-db/issues/12
[ronin-db#11]: https://github.com/ronin-rb/ronin-db/issues/11
[ronin-db#10]: https://github.com/ronin-rb/ronin-db/issues/10
[ronin-db#9]: https://github.com/ronin-rb/ronin-db/issues/9
[ronin-db#7]: https://github.com/ronin-rb/ronin-db/issues/7
[ronin-db#5]: https://github.com/ronin-rb/ronin-db/issues/5

### [ronin-asm](https://github.com/ronin-rb/ronin-asm/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-asm] is a Ruby DSL for crafting Assmebly programs and Shellcode.

**Note:** Development work is currently taking place on the
[1.2.0](https://github.com/ronin-rb/ronin-vuln-lfi/tree/0.3.0) branch.

* [ ] [Replace options={} with keyword arguments][ronin-asm#20]
* [ ] [Add truffleruby to the CI][ronin-asm#17]

[ronin-asm#20]: https://github.com/ronin-rb/ronin-asm/issues/20
[ronin-asm#17]: https://github.com/ronin-rb/ronin-asm/issues/17

* [x] [Remove data_paths dependency][ronin-asm#19]

[ronin-asm#19]: https://github.com/ronin-rb/ronin-asm/issues/19

### [ronin-sql](https://github.com/ronin-rb/ronin-sql/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-sql] is a Ruby DSL for crafting SQL Injections.

**Note:** Development work is currently taking place on the
[1.2.0](https://github.com/ronin-rb/ronin-vuln-lfi/tree/1.2.0) branch.

* [ ] [Rename extensions directory to core_ext][ronin-sql#8]
* [ ] [Replace options={} with keyword arguments][ronin-sql#7]
* [ ] [Add a sql: keyword argument for selecting the SQL dialect][ronin-sql#9]

[ronin-sql#8]: https://github.com/ronin-rb/ronin-sql/issues/8
[ronin-sql#7]: https://github.com/ronin-rb/ronin-sql/issues/7
[ronin-sql#9]: https://github.com/ronin-rb/ronin-sql/issues/9

* [x] [Switch rake console back to irb][ronin-sql#6]
* [x] [Move yard dependency into the Gemfile][ronin-sql#5]

[ronin-sql#6]: https://github.com/ronin-rb/ronin-sql/issues/6
[ronin-sql#5]: https://github.com/ronin-rb/ronin-sql/issues/5

### [ronin-web-server](https://github.com/ronin-rb/ronin-web-server/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-web-server] is a custom Ruby web server based on Sinatra tailored for
security research and development.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-web-server/tree/main) branch.

* [ ] [Add support for the RONIN_HTTP_PROXY env variable][ronin-web-server#17]
* [ ] [Add rack-user_agent as a dependency][ronin-web-server#16]
* [ ] [Replace print_debug statements in Ronin::Web::Proxy with Logger statements][ronin-web-server#14]
* [ ] [Change default/preferred HTTP server to falcon?][ronin-web-server#12]
* [ ] [Refactor the Proxy class to use async-http][ronin-web-server#11]
* [ ] [Switch options={} to keyword arguments][ronin-web-server#9]
* [ ] [Disable Rack::Protection in Ronin::Web::Proxy][ronin-web-server#4]

[ronin-web-server#17]: https://github.com/ronin-rb/ronin-web-server/issues/17
[ronin-web-server#16]: https://github.com/ronin-rb/ronin-web-server/issues/16
[ronin-web-server#14]: https://github.com/ronin-rb/ronin-web-server/issues/14
[ronin-web-server#12]: https://github.com/ronin-rb/ronin-web-server/issues/12
[ronin-web-server#11]: https://github.com/ronin-rb/ronin-web-server/issues/11
[ronin-web-server#9]: https://github.com/ronin-rb/ronin-web-server/issues/9
[ronin-web-server#4]: https://github.com/ronin-rb/ronin-web-server/issues/4

* [x] [Add webrick as a dependency][ronin-web-server#15]
* [x] [Remove Ronin::Web::Server::Conditions::ClassMethods#campaign][ronin-web-server#13]
* [x] [Move Ronin::Web::Proxy into Ronin::Web::Server][ronin-web-server#10]
* [x] [Re-add project files][ronin-web-server#3]
* [x] [Relicense as LGPL-3.0][ronin-web-server#1]

[ronin-web-server#15]: https://github.com/ronin-rb/ronin-web-server/issues/15
[ronin-web-server#13]: https://github.com/ronin-rb/ronin-web-server/issues/13
[ronin-web-server#10]: https://github.com/ronin-rb/ronin-web-server/issues/10
[ronin-web-server#3]: https://github.com/ronin-rb/ronin-web-server/issues/3
[ronin-web-server#1]: https://github.com/ronin-rb/ronin-web-server/issues/1

### [ronin-web-spider](https://github.com/ronin-rb/ronin-web-spider/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-web-spider] is a collection of common web spidering routines using the
spidr gem.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-web-spider/tree/main) branch.

* [ ] [Add support for RONIN_HTTP_PROXY env variable][ronin-web-spider#4]
* [ ] [Add top-level methods for common spidering tasks][ronin-web-spider#3]

[ronin-web-spider#4]: https://github.com/ronin-rb/ronin-web-spider/issues/4
[ronin-web-spider#3]: https://github.com/ronin-rb/ronin-web-spider/issues/3

* [x] [Re-add project files][ronin-web-spider#2]
* [x] [Change license to LGPL-3.0][ronin-web-spider#1]

[ronin-web-spider#2]: https://github.com/ronin-rb/ronin-web-spider/issues/2
[ronin-web-spider#1]: https://github.com/ronin-rb/ronin-web-spider/issues/1

### [ronin-web-user_agents](https://github.com/ronin-rb/ronin-web-user_agents/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-web-user_agents] is yet another User-Agent randomiser library.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-web-user_agents/tree/main) branch.

* [ ] [Add top-level class-methods for the various categories][ronin-web-user_agents#7]
* [ ] [Add a Category class][ronin-web-user_agents#6]
* [ ] [Add a method for building a custom User-Agent string][ronin-web-user_agents#5]
* [ ] [Update User-Agent lists][ronin-web-user_agents#4]
* [ ] [Replace the .yml file with multiple .txt and .csv files][ronin-web-user_agents#3]

[ronin-web-user_agents#7]: https://github.com/ronin-rb/ronin-web-user_agents/issues/7
[ronin-web-user_agents#6]: https://github.com/ronin-rb/ronin-web-user_agents/issues/6
[ronin-web-user_agents#5]: https://github.com/ronin-rb/ronin-web-user_agents/issues/5
[ronin-web-user_agents#4]: https://github.com/ronin-rb/ronin-web-user_agents/issues/4
[ronin-web-user_agents#3]: https://github.com/ronin-rb/ronin-web-user_agents/issues/3

* [x] [Re-add project files][ronin-web-user_agents#2]
* [x] [Change license to LGPL-3.0][ronin-web-user_agents#1]

[ronin-web-user_agents#2]: https://github.com/ronin-rb/ronin-web-user_agents/issues/2
[ronin-web-user_agents#1]: https://github.com/ronin-rb/ronin-web-user_agents/issues/1

### [ronin-web](https://github.com/ronin-rb/ronin-web/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-web] is a Ruby library that provides support for web scraping and
spidering functionality.

**Note:** Development work is currently taking place on the
[1.0.0](https://github.com/ronin-rb/ronin-web/tree/1.0.0) branch.

* [ ] [Add a spider sub-command][ronin-web#59]
* [ ] [Add a server sub-command][ronin-web#58]
* [ ] [Add support for a RONIN_HTTP_PROXY env variable][ronin-web#51]
* [ ] [Add a proxy command][ronin-web#39]
* [ ] [Add a MITM -> Browser Proxy command][ronin-web#38]
* [ ] [Add a diff sub-command][ronin-web#28]
* [ ] [Eventually re-add jruby to the CI matrix][ronin-web#26]
* [ ] [Eventually support truffleruby][ronin-web#25]

[ronin-web#59]: https://github.com/ronin-rb/ronin-web/issues/59
[ronin-web#58]: https://github.com/ronin-rb/ronin-web/issues/58
[ronin-web#51]: https://github.com/ronin-rb/ronin-web/issues/51
[ronin-web#39]: https://github.com/ronin-rb/ronin-web/issues/39
[ronin-web#38]: https://github.com/ronin-rb/ronin-web/issues/38
[ronin-web#28]: https://github.com/ronin-rb/ronin-web/issues/28
[ronin-web#26]: https://github.com/ronin-rb/ronin-web/issues/26
[ronin-web#25]: https://github.com/ronin-rb/ronin-web/issues/25

* [x] [Add a common Ronin::Web::CLI::Command base class][ronin-web#57]
* [x] [Add ronin-core as a dependency][ronin-web#56]
* [x] [Add nokogiri-ext as a dependency][ronin-web#55]
* [x] [Add ronin-web-spider as a dependency][ronin-web#54]
* [x] [Add ronin-web-user_agents as a dependency][ronin-web#53]
* [x] [Remove ronin/web/extensions/nokogiri in favor of nokogiri-ext][ronin-web#52]
* [x] [Remove the ronin/web/user_agents.rb file in favor of the new ronin-web-user_agents gem][ronin-web#50]
* [x] [Remove ronin/web/spider in favor of the new ronin-web-spider gem][ronin-web#49]
* [x] [Extract ronin/web/spider out into its own library][ronin-web#48]
* [x] [Extract ronin/web/user_agents out into it's own library][ronin-web#47]
* [x] [Extract ronin/web/extensions/nokogiri/ into it's own library][ronin-web#46]
* [x] [Bump required_ruby_version to >= 2.7.0][ronin-web#44]
* [x] [Remove DataMapper/DM related code from Gemfile][ronin-web#43]
* [x] [Remove the yard-parameters dependency][ronin-web#42]
* [x] [Remove ronin/network/mixins/web][ronin-web#41]
* [x] [Add ronin-web-server as a dependency][ronin-web#40]
* [x] [Remove ronin/web/proxy in favor of the new ronin-web-server dependency][ronin-web#35]
* [x] [Remove ronin/web/server in favor of the ronin-web-server dependency][ronin-web#34]
* [x] [Add a Ronin::Web::CLI class][ronin-web#32]
* [x] [Add nokogiri-diff as a dependency][ronin-web#27]
* [x] [Remove the yard\* dependencies from the gemspec][ronin-web#24]
* [x] [Remove the ronin dependency][ronin-web#23]
* [x] [Remove the data_paths dependency][ronin-web#22]
* [x] [Rename extensions/ to core_ext/][ronin-web#21]
* [x] [Extract Ronin::Web::Server out into ronin-web-server][ronin-web#20]

[ronin-web#57]: https://github.com/ronin-rb/ronin-web/issues/57
[ronin-web#56]: https://github.com/ronin-rb/ronin-web/issues/56
[ronin-web#55]: https://github.com/ronin-rb/ronin-web/issues/55
[ronin-web#54]: https://github.com/ronin-rb/ronin-web/issues/54
[ronin-web#53]: https://github.com/ronin-rb/ronin-web/issues/53
[ronin-web#52]: https://github.com/ronin-rb/ronin-web/issues/52
[ronin-web#50]: https://github.com/ronin-rb/ronin-web/issues/50
[ronin-web#49]: https://github.com/ronin-rb/ronin-web/issues/49
[ronin-web#48]: https://github.com/ronin-rb/ronin-web/issues/48
[ronin-web#47]: https://github.com/ronin-rb/ronin-web/issues/47
[ronin-web#46]: https://github.com/ronin-rb/ronin-web/issues/46
[ronin-web#44]: https://github.com/ronin-rb/ronin-web/issues/44
[ronin-web#43]: https://github.com/ronin-rb/ronin-web/issues/43
[ronin-web#42]: https://github.com/ronin-rb/ronin-web/issues/42
[ronin-web#41]: https://github.com/ronin-rb/ronin-web/issues/41
[ronin-web#40]: https://github.com/ronin-rb/ronin-web/issues/40
[ronin-web#35]: https://github.com/ronin-rb/ronin-web/issues/35
[ronin-web#34]: https://github.com/ronin-rb/ronin-web/issues/34
[ronin-web#32]: https://github.com/ronin-rb/ronin-web/issues/32
[ronin-web#27]: https://github.com/ronin-rb/ronin-web/issues/27
[ronin-web#24]: https://github.com/ronin-rb/ronin-web/issues/24
[ronin-web#23]: https://github.com/ronin-rb/ronin-web/issues/23
[ronin-web#22]: https://github.com/ronin-rb/ronin-web/issues/22
[ronin-web#21]: https://github.com/ronin-rb/ronin-web/issues/21
[ronin-web#20]: https://github.com/ronin-rb/ronin-web/issues/20

### [ronin-vuln-lfi](https://github.com/ronin-rb/ronin-vuln-lfi/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-vuln-lfi] is a small Ruby library to test for Local File Inclusion (LFI)
vulnerabilities.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-vuln-lfi/tree/main) branch.

* [ ] [Add a Dockerfile for a vulnerable PHP app][ronin-vuln-lfi#7]
* [ ] [Add tests chore tests][ronin-vuln-lfi#6]
* [ ] [Add WebMock tests for Ronin::Vuln::LFI.test][ronin-vuln-lfi#4]

[ronin-vuln-lfi#7]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/7
[ronin-vuln-lfi#6]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/6
[ronin-vuln-lfi#4]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/4

* [x] [Replace options={} with keyword arguments chore ruby-2.x][ronin-vuln-lfi#5]
* [x] [Re-add project files][ronin-vuln-lfi#3]
* [x] [Change license to LGPL-3.0][ronin-vuln-lfi#2]
* [x] [Rename project to ronin-vuln-lfi][ronin-vuln-lfi#1]

[ronin-vuln-lfi#5]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/5
[ronin-vuln-lfi#3]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/3
[ronin-vuln-lfi#2]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/2
[ronin-vuln-lfi#1]: https://github.com/ronin-rb/ronin-vuln-lfi/issues/1

### [ronin-vuln-rfi](https://github.com/ronin-rb/ronin-vuln-rfi/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-vuln-rfi] is a small Ruby library for testing Remote File Inclusion
(RFI) vulnerabilities.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-vuln-rfi/tree/main) branch.

* [ ] [Add RFI.test_server and RFI.test_server= methods][ronin-vuln-rfi#12]
* [ ] [Add an example vulnerable JSP app][ronin-vuln-rfi#11]
* [ ] [Add an example vulnerable PHP app][ronin-vuln-rfi#10]
* [ ] [Add a Dockerfile for serving the test scripts][ronin-vuln-rfi#9]
* [ ] [Add support for testing RFI against JSP][ronin-vuln-rfi#8]
* [ ] [Add WebMock tests for Ronin::Vuln::RFI.test][ronin-vuln-rfi#4]

[ronin-vuln-rfi#12]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/12
[ronin-vuln-rfi#11]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/11
[ronin-vuln-rfi#10]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/10
[ronin-vuln-rfi#9]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/9
[ronin-vuln-rfi#8]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/8
[ronin-vuln-rfi#4]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/4

* [x] [Rename ronin/vuln/rfi/extensions to ronin/vuln/rfi/core_ext][ronin-vuln-rfi#6]
* [x] [Replace options={} with keyword arguments][ronin-vuln-rfi#5]
* [x] [Re-add project files][ronin-vuln-rfi#3]
* [x] [Change the license to LGPL-3.0][ronin-vuln-rfi#2]
* [x] [Rename project to ronin-vuln-rfi][ronin-vuln-rfi#1]

[ronin-vuln-rfi#6]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/6
[ronin-vuln-rfi#5]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/5
[ronin-vuln-rfi#3]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/3
[ronin-vuln-rfi#2]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/2
[ronin-vuln-rfi#1]: https://github.com/ronin-rb/ronin-vuln-rfi/issues/1

### [ronin-post_ex](https://github.com/ronin-rb/ronin-post_ex/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-post_ex] is a Ruby API for Post-Exploitation.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-post_ex/tree/main) branch.

* [ ] [Add a call method to System][ronin-post_ex#21]
* [ ] [Add a Net resource for networking methods][ronin-post_ex#20]
* [ ] [Add a Socket resource similar to File][ronin-post_ex#19]
* [ ] [Add top-level methods to System that can use fs/process or shell_exec equivalent commands][ronin-post_ex#11]

[ronin-post_ex#21]: https://github.com/ronin-rb/ronin-post_ex/issues/21
[ronin-post_ex#20]: https://github.com/ronin-rb/ronin-post_ex/issues/20
[ronin-post_ex#19]: https://github.com/ronin-rb/ronin-post_ex/issues/19
[ronin-post_ex#11]: https://github.com/ronin-rb/ronin-post_ex/issues/11

* [x] [Rename Mixin to System][ronin-post_ex#18]
* [x] [Refactor Shells::FS to use Ronin::Core::CLI::Shell][ronin-post_ex#17]
* [x] [Document the Post Exploitation API][ronin-post_ex#16]
* [x] [Bump copyright year][ronin-post_ex#15]
* [x] [Update project name/description in license headers][ronin-post_ex#14]
* [x] [Change license to LGPL-3.0][ronin-post_ex#13]
* [x] [Re-add project files][ronin-post_ex#12]
* [x] [Add a Ronin::PostEx::System class][ronin-post_ex#10]
* [x] [Replace Ronin::PostExploitation::IO with the fake_io gem][ronin-post_ex#9]
* [x] [Add Ronin::PostEx::CapturedFile][ronin-post_ex#1]
* [x] [Rename Ronin::PostExploiitation::File to RemoteFile][ronin-post_ex#5]
* [x] [Extract Ronin::PostExploitation::IO out into it's own gem][ronin-post_ex#2]

[ronin-post_ex#18]: https://github.com/ronin-rb/ronin-post_ex/issues/18
[ronin-post_ex#17]: https://github.com/ronin-rb/ronin-post_ex/issues/17
[ronin-post_ex#16]: https://github.com/ronin-rb/ronin-post_ex/issues/16
[ronin-post_ex#15]: https://github.com/ronin-rb/ronin-post_ex/issues/15
[ronin-post_ex#14]: https://github.com/ronin-rb/ronin-post_ex/issues/14
[ronin-post_ex#13]: https://github.com/ronin-rb/ronin-post_ex/issues/13
[ronin-post_ex#12]: https://github.com/ronin-rb/ronin-post_ex/issues/12
[ronin-post_ex#10]: https://github.com/ronin-rb/ronin-post_ex/issues/10
[ronin-post_ex#9]: https://github.com/ronin-rb/ronin-post_ex/issues/9
[ronin-post_ex#1]: https://github.com/ronin-rb/ronin-post_ex/issues/1
[ronin-post_ex#5]: https://github.com/ronin-rb/ronin-post_ex/issues/5
[ronin-post_ex#2]: https://github.com/ronin-rb/ronin-post_ex/issues/2

### [ronin-c2](https://github.com/ronin-rb/ronin-c2/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-c2] is a C2 library for ronin that can communicate with various payloads
and agents.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-c2/tree/main) branch.

* [ ] [Add Ronin::C2::ConnectBackShell class][ronin-c2#26]
* [ ] [Add Ronin::C2::BindShell class][ronin-c2#25]
* [ ] [Add Ronin::C2::Agent::HTTPServer class][ronin-c2#24]
* [ ] [Add Ronin::C2::Agent::HTTPClient class][ronin-c2#23]
* [ ] [Add Ronin::C2::Agent::TCPServer class][ronin-c2#22]
* [ ] [Add Ronin::C2::Agent::TCPClient class][ronin-c2#21]
* [ ] [Add support for the RONIN_HTTP_PROXY env variable][ronin-c2#20]
* [ ] [Add project files][ronin-c2#19]
* [ ] [Add a Ronin::C2::Encoding::RSA class][ronin-c2#18]
* [ ] [Add a Ronin::C2::Encoding::Base64 class][ronin-c2#17]
* [ ] [Add a Ronin::C2::Message::JSONRPC::Response class][ronin-c2#13]
* [ ] [Add a Ronin::C2::Message::JSONRPC::Request class][ronin-c2#12]
* [ ] [Add a Ronin::C2::Message::Response abstract class][ronin-c2#11]
* [ ] [Add a Ronin::C2::Message::Request abstract class][ronin-c2#10]
* [ ] [Add a Ronin::C2::Transport::HTTPServer class][ronin-c2#9]
* [ ] [Add a Ronin::C2::Transport::HTTPClient class][ronin-c2#8]
* [ ] [Add a Ronin::C2::Transport::TCPServer class][ronin-c2#7]
* [ ] [Add Ronin::C2::Transport::TCPClient class][ronin-c2#6]
* [ ] [Add async-io and async-http as dependencies][ronin-c2#5]
* [ ] [Add ronin-post_exploitation as a dependency][ronin-c2#3]
* [ ] [Add a ronin-c2 main command][ronin-c2#1]
* [ ] [Add sub-commands for connecting to or starting C2 end-points][ronin-c2#2]
* [ ] [Add ronin-core as a dependency][ronin-c2#4]

[ronin-c2#26]: https://github.com/ronin-rb/ronin-c2/issues/26
[ronin-c2#25]: https://github.com/ronin-rb/ronin-c2/issues/25
[ronin-c2#24]: https://github.com/ronin-rb/ronin-c2/issues/24
[ronin-c2#23]: https://github.com/ronin-rb/ronin-c2/issues/23
[ronin-c2#22]: https://github.com/ronin-rb/ronin-c2/issues/22
[ronin-c2#21]: https://github.com/ronin-rb/ronin-c2/issues/21
[ronin-c2#20]: https://github.com/ronin-rb/ronin-c2/issues/20
[ronin-c2#19]: https://github.com/ronin-rb/ronin-c2/issues/19
[ronin-c2#18]: https://github.com/ronin-rb/ronin-c2/issues/18
[ronin-c2#17]: https://github.com/ronin-rb/ronin-c2/issues/17
[ronin-c2#13]: https://github.com/ronin-rb/ronin-c2/issues/13
[ronin-c2#12]: https://github.com/ronin-rb/ronin-c2/issues/12
[ronin-c2#11]: https://github.com/ronin-rb/ronin-c2/issues/11
[ronin-c2#10]: https://github.com/ronin-rb/ronin-c2/issues/10
[ronin-c2#9]: https://github.com/ronin-rb/ronin-c2/issues/9
[ronin-c2#8]: https://github.com/ronin-rb/ronin-c2/issues/8
[ronin-c2#7]: https://github.com/ronin-rb/ronin-c2/issues/7
[ronin-c2#6]: https://github.com/ronin-rb/ronin-c2/issues/6
[ronin-c2#5]: https://github.com/ronin-rb/ronin-c2/issues/5
[ronin-c2#3]: https://github.com/ronin-rb/ronin-c2/issues/3
[ronin-c2#1]: https://github.com/ronin-rb/ronin-c2/issues/1
[ronin-c2#2]: https://github.com/ronin-rb/ronin-c2/issues/2
[ronin-c2#4]: https://github.com/ronin-rb/ronin-c2/issues/4

### [ronin-agent-node](https://github.com/ronin-rb/ronin-agent-node/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-agent-node] is a ronin agent written in node.js.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-agent-node/tree/main) branch.

* [ ] [Support JSON RPC 2.0][ronin-agent-node#8]
* [ ] [Add a build script][ronin-agent-node#5]
* [ ] [Update code to use let and const][ronin-agent-node#4]

[ronin-agent-node#8]: https://github.com/ronin-rb/ronin-agent-node/issues/8
[ronin-agent-node#5]: https://github.com/ronin-rb/ronin-agent-node/issues/5
[ronin-agent-node#4]: https://github.com/ronin-rb/ronin-agent-node/issues/4

### [ronin-agent-php](https://github.com/ronin-rb/ronin-agent-php/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-agent-php] is a ronin agent written in PHP.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-agent-php/tree/main) branch.

* [ ] [Support JSON RPC 2.0][ronin-agent-php#8]
* [ ] [Add a build script][ronin-agent-php#5]
* [ ] [Upgrade the code to PHP5][ronin-agent-php#4]

[ronin-agent-php#8]: https://github.com/ronin-rb/ronin-agent-php/issues/8
[ronin-agent-php#5]: https://github.com/ronin-rb/ronin-agent-php/issues/5
[ronin-agent-php#4]: https://github.com/ronin-rb/ronin-agent-php/issues/4

### [ronin-agent-ruby](https://github.com/ronin-rb/ronin-agent-ruby/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-agent-ruby] is a ronin agent written in Ruby.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-agent-ruby/tree/main) branch.

* [ ] [Move Agent::TCP, Agent::UDP, and Agent::HTTP into Agent::Transports][ronin-agent-ruby#6]
* [ ] [Rename Transport to Message][ronin-agent-ruby#5]
* [ ] [Support JSON RPC 2.0][ronin-agent-ruby#4]
* [ ] [Rewrite TCP::Server to use TCPServer][ronin-agent-ruby#2]

[ronin-agent-ruby#6]: https://github.com/ronin-rb/ronin-agent-ruby/issues/6
[ronin-agent-ruby#5]: https://github.com/ronin-rb/ronin-agent-ruby/issues/5
[ronin-agent-ruby#4]: https://github.com/ronin-rb/ronin-agent-ruby/issues/4
[ronin-agent-ruby#2]: https://github.com/ronin-rb/ronin-agent-ruby/issues/2

* [x] [Move all RPC methods into an RPC module][ronin-agent-ruby#8]

[ronin-agent-ruby#8]: https://github.com/ronin-rb/ronin-agent-ruby/issues/8

### [ronin-payloads](https://github.com/ronin-rb/ronin-payloads/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-payloads] is a Ruby micro-framework for writing and running exploit
payloads.

**Note:** Development work is currently taking place on the
[main](https://github.com/ronin-rb/ronin-payloads/tree/main) branch.

* [ ] [Refactor Payloads and Encoders classes to be plain Ruby Classes][ronin-payloads#24]
* [ ] [Move Ronin::Encoders into Ronin::Payloads::][ronin-payloads#22]
* [ ] [Remove the ronin/gen directory][ronin-payloads#15]
* [ ] [Add a Ronin::Payloads::CLI::Commands::Gen command][ronin-payloads#14]
* [ ] [Replace all database properties with class methods for declaring metadata][ronin-payloads#11]
* [ ] [Replace options={} with keyword arguments][ronin-payloads#10]
* [ ] [Rename Ronin::UI::CLI to Ronin::Payloads::CLI][ronin-payloads#9]
* [ ] [Refactor Ronin::UI::CLI::Commands to use Ronin::Core::CLI::Command][ronin-payloads#8]
* [ ] [Add ronin-c2 as a dependency][ronin-payloads#6]

[ronin-payloads#24]: https://github.com/ronin-rb/ronin-payloads/issues/24
[ronin-payloads#22]: https://github.com/ronin-rb/ronin-payloads/issues/22
[ronin-payloads#15]: https://github.com/ronin-rb/ronin-payloads/issues/15
[ronin-payloads#14]: https://github.com/ronin-rb/ronin-payloads/issues/14
[ronin-payloads#11]: https://github.com/ronin-rb/ronin-payloads/issues/11
[ronin-payloads#10]: https://github.com/ronin-rb/ronin-payloads/issues/10
[ronin-payloads#9]: https://github.com/ronin-rb/ronin-payloads/issues/9
[ronin-payloads#8]: https://github.com/ronin-rb/ronin-payloads/issues/8
[ronin-payloads#6]: https://github.com/ronin-rb/ronin-payloads/issues/6

* [x] [Added ronin-repos as a dependency][ronin-payloads#25]
* [x] [Add ronin-post_ex as a dependency][ronin-payloads#23]
* [x] [Change license to LGPL-3.0][ronin-payloads#21]
* [x] [Remove ronin/payloads/helpers][ronin-payloads#20]
* [x] [Remove ronin/database/migrations][ronin-payloads#13]
* [x] [Re-add project files][ronin-payloads#12]
* [x] [Add ronin-core as a dependency][ronin-payloads#7]

[ronin-payloads#25]: https://github.com/ronin-rb/ronin-payloads/issues/25
[ronin-payloads#23]: https://github.com/ronin-rb/ronin-payloads/issues/23
[ronin-payloads#21]: https://github.com/ronin-rb/ronin-payloads/issues/21
[ronin-payloads#20]: https://github.com/ronin-rb/ronin-payloads/issues/20
[ronin-payloads#13]: https://github.com/ronin-rb/ronin-payloads/issues/13
[ronin-payloads#12]: https://github.com/ronin-rb/ronin-payloads/issues/12
[ronin-payloads#7]: https://github.com/ronin-rb/ronin-payloads/issues/7

### [ronin-exploits](https://github.com/ronin-rb/ronin-exploits/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

[ronin-exploits] is a Ruby library for writing and running exploits and
payloads.

**Note:** Development work is currently taking place on the
[1.0.0](https://github.com/ronin-rb/ronin-exploits/tree/1.0.0) branch.

* [ ] [Add a Ronin::Exploits::CLI::Commands::Gen subcommand][ronin-exploits#69]
* [ ] [Replace all database properties with class methods for declaring metadata][ronin-exploits#66]
* [ ] [Replace options={} with keyword arguments][ronin-exploits#65]
* [ ] [Add ronin-c2 as a dependency][ronin-exploits#62]
* [ ] [Include Ronin::Core::ModuleRegistry into Ronin::Exploits][ronin-exploits#58]
* [ ] [Update the ronin-exploits/ronin-exploit commands to use ronin-repos][ronin-exploits#57]
* [ ] [Add a Ronin::Exploits::CLI main command class][ronin-exploits#55]
* [ ] [Rename Ronin::UI::CLI to Ronin::Exploits::CLI][ronin-exploits#54]
* [ ] [Refactor the Ronin::Exploits::CLI::Commands classes to use Ronin::Core::CLI::Command][ronin-exploits#53]
* [ ] [Eventually support truffleruby][ronin-exploits#40]
* [ ] [Eventually re-enable jruby in the CI][ronin-exploits#39]
* [ ] [Add a "new" subcommand][ronin-exploits#37]
* [ ] [Rename to ronin-exploit or ronin-exploitation to avoid confusion?][ronin-exploits#30]
* [ ] [Refactor Ronin::Exploits::Exploit classes to be plain Ruby Classes][ronin-exploits#29]

[ronin-exploits#69]: https://github.com/ronin-rb/ronin-exploits/issues/69
[ronin-exploits#66]: https://github.com/ronin-rb/ronin-exploits/issues/66
[ronin-exploits#65]: https://github.com/ronin-rb/ronin-exploits/issues/65
[ronin-exploits#62]: https://github.com/ronin-rb/ronin-exploits/issues/62
[ronin-exploits#58]: https://github.com/ronin-rb/ronin-exploits/issues/58
[ronin-exploits#57]: https://github.com/ronin-rb/ronin-exploits/issues/57
[ronin-exploits#55]: https://github.com/ronin-rb/ronin-exploits/issues/55
[ronin-exploits#54]: https://github.com/ronin-rb/ronin-exploits/issues/54
[ronin-exploits#53]: https://github.com/ronin-rb/ronin-exploits/issues/53
[ronin-exploits#40]: https://github.com/ronin-rb/ronin-exploits/issues/40
[ronin-exploits#39]: https://github.com/ronin-rb/ronin-exploits/issues/39
[ronin-exploits#37]: https://github.com/ronin-rb/ronin-exploits/issues/37
[ronin-exploits#30]: https://github.com/ronin-rb/ronin-exploits/issues/30
[ronin-exploits#29]: https://github.com/ronin-rb/ronin-exploits/issues/29

* [x] [Require ruby >= 2.7.0][ronin-exploits#80]
* [x] [Change license to LGPL-3.0][ronin-exploits#79]
* [x] [Add ronin-core as a dependency][ronin-exploits#78]
* [x] [Remove dm-visualizer dependency][ronin-exploits#77]
* [x] [Add ronin-post_ex as a dependency][ronin-exploits#76]
* [x] [Remove the yard-parameters dependency][ronin-exploits#75]
* [x] [Remove the yard-dm dependency][ronin-exploits#74]
* [x] [Remove ronin/vuln.rb][ronin-exploits#73]
* [x] [Remove ronin/advisory.rb][ronin-exploits#72]
* [x] [Remove exploits related database migration files from ronin/database/migrations/][ronin-exploits#71]
* [x] [Remove ronin/gen/ directory][ronin-exploits#70]
* [x] [Remove payload and encoder files in favor of ronin-payloads][ronin-exploits#67]
* [x] [Extract lib/ronin/payloads out into it's own repository][ronin-exploits#64]
* [x] [Add ronin-payloads as a dependency][ronin-exploits#63]
* [x] [Remove ronin/post_exploitation in favor of the new ronin-post_exploitation gem][ronin-exploits#61]
* [x] [Add ronin-repos as a dependency][ronin-exploits#56]
* [x] [Remove the ronin dependency][ronin-exploits#49]
* [x] [Delete ronin/payloads in favor of a new ronin-payloads gem][ronin-exploits#46]
* [x] [Extract Ronin::PostExploitation into it's own repository][ronin-exploits#45]
* [x] [Extract the Ruby RPC payload out into it's own repository][ronin-exploits#44]
* [x] [Extract the PHP RPC payload out into it's own repository][ronin-exploits#43]
* [x] [Extract the node.js RPC payload out into it's own repository][ronin-exploits#42]
* [x] [Move yard dependencies from gemspec.yml into Gemfile][ronin-exploits#38]
* [x] [Remove ronin-gen dependency][ronin-exploits#35]
* [x] [Remove data_paths dependency][ronin-exploits#34]
* [x] [Remove open_namespace dependency][ronin-exploits#33]

[ronin-exploits#80]: https://github.com/ronin-rb/ronin-exploits/issues/80
[ronin-exploits#79]: https://github.com/ronin-rb/ronin-exploits/issues/79
[ronin-exploits#78]: https://github.com/ronin-rb/ronin-exploits/issues/78
[ronin-exploits#77]: https://github.com/ronin-rb/ronin-exploits/issues/77
[ronin-exploits#76]: https://github.com/ronin-rb/ronin-exploits/issues/76
[ronin-exploits#75]: https://github.com/ronin-rb/ronin-exploits/issues/75
[ronin-exploits#74]: https://github.com/ronin-rb/ronin-exploits/issues/74
[ronin-exploits#73]: https://github.com/ronin-rb/ronin-exploits/issues/73
[ronin-exploits#72]: https://github.com/ronin-rb/ronin-exploits/issues/72
[ronin-exploits#71]: https://github.com/ronin-rb/ronin-exploits/issues/71
[ronin-exploits#70]: https://github.com/ronin-rb/ronin-exploits/issues/70
[ronin-exploits#67]: https://github.com/ronin-rb/ronin-exploits/issues/67
[ronin-exploits#64]: https://github.com/ronin-rb/ronin-exploits/issues/64
[ronin-exploits#63]: https://github.com/ronin-rb/ronin-exploits/issues/63
[ronin-exploits#61]: https://github.com/ronin-rb/ronin-exploits/issues/61
[ronin-exploits#56]: https://github.com/ronin-rb/ronin-exploits/issues/56
[ronin-exploits#49]: https://github.com/ronin-rb/ronin-exploits/issues/49
[ronin-exploits#46]: https://github.com/ronin-rb/ronin-exploits/issues/46
[ronin-exploits#45]: https://github.com/ronin-rb/ronin-exploits/issues/45
[ronin-exploits#44]: https://github.com/ronin-rb/ronin-exploits/issues/44
[ronin-exploits#43]: https://github.com/ronin-rb/ronin-exploits/issues/43
[ronin-exploits#42]: https://github.com/ronin-rb/ronin-exploits/issues/42
[ronin-exploits#38]: https://github.com/ronin-rb/ronin-exploits/issues/38
[ronin-exploits#35]: https://github.com/ronin-rb/ronin-exploits/issues/35
[ronin-exploits#34]: https://github.com/ronin-rb/ronin-exploits/issues/34
[ronin-exploits#33]: https://github.com/ronin-rb/ronin-exploits/issues/33

### [ronin](https://github.com/ronin-rb/ronin/issues?q=is%3Aopen+is%3Aissue+project%3Aronin-rb%2F2)

The main [ronin] gem.

**Note:** Development work is currently taking place on the
[2.0.0](https://github.com/ronin-rb/ronin/tree/2.0.0) branch.

* [ ] [Eventually re-add jruby to the CI matrix][ronin#71]
* [ ] [Eventually support truffleruby][ronin#70]
* [ ] [Make ronin a "meta gem" which pulls in all other ronin-\* gems][ronin#61]
* [ ] [Add a tip subcommand][ronin#55]
* [ ] [Add a gen subcommand][ronin#54]
* [ ] [Add a http subcommand][ronin#53]
* [ ] [Add a netcat subcommand][ronin#52]
* [ ] [Add a unhexdump subcommand to ronin using Ronin::Binary::Hexdump::Parser in ronin-support][ronin#51]
* [ ] [Add a hexdump subcommand][ronin#50]
* [ ] [Add a smart grep subcommand][ronin#49]
* [ ] [Add a strings subcommand][ronin#48]
* [ ] [Add enc and dec subcommands][ronin#47]

[ronin#71]: https://github.com/ronin-rb/ronin/issues/71
[ronin#70]: https://github.com/ronin-rb/ronin/issues/70
[ronin#61]: https://github.com/ronin-rb/ronin/issues/61
[ronin#55]: https://github.com/ronin-rb/ronin/issues/55
[ronin#54]: https://github.com/ronin-rb/ronin/issues/54
[ronin#53]: https://github.com/ronin-rb/ronin/issues/53
[ronin#52]: https://github.com/ronin-rb/ronin/issues/52
[ronin#51]: https://github.com/ronin-rb/ronin/issues/51
[ronin#50]: https://github.com/ronin-rb/ronin/issues/50
[ronin#49]: https://github.com/ronin-rb/ronin/issues/49
[ronin#48]: https://github.com/ronin-rb/ronin/issues/48
[ronin#47]: https://github.com/ronin-rb/ronin/issues/47

* [x] [Re-add the Ronin::CLI::Command base class][ronin#86]
* [x] [Remove Ronin::Installation][ronin#85]
* [x] [Bump required_ruby_version to 2.7.0][ronin#84]
* [x] [Remove lib/bond/][ronin#83]
* [x] [Remove files replaced by ronin-core][ronin#82]
* [x] [Remove yard-dm dependency][ronin#81]
* [x] [Remove dm-\* dependencies][ronin#80]
* [x] [Add ronin-db as a dependency][ronin#79]
* [x] [Move the ronin-fuzzer command into the ronin-fuzzer repository][ronin#78]
* [x] [Rename Ronin::UI::CLI to just Ronin::CLI][ronin#77]
* [x] [Remove Ronin::UI::Console in favor of Ronin::Core::Console][ronin#76]
* [x] [Add ronin-repos as a dependency][ronin#75]
* [x] [Add ronin-core as a dependency][ronin#74]
* [x] [Refactor Ronin::CLI::Commands classes to use ronin-core and command_kit][ronin#73]
* [x] [Move yard development dependencies into Gemfile][ronin#69]
* [x] [Remove the uri-query_params dependency][ronin#68]
* [x] [Remove the pullr dependency][ronin#67]
* [x] [Remove the parameters dependency][ronin#66]
* [x] [Remove the object_loader dependency][ronin#65]
* [x] [Remove the data_paths dependency][ronin#64]
* [x] [Remove all ripl-\* dependencies][ronin#63]
* [x] [Refactor Ronin::CLI to use CommandKit][ronin#60]
* [x] [ronin with no arguments should print help][ronin#46]
* [x] [Remove bin/ronin-\* commands in favor of a single ronin command with subcommands][ronin#45]
* [x] [ronin help should list other ronin-\* commands from other ronin-\* libraries][ronin#44]

[ronin#86]: https://github.com/ronin-rb/ronin/issues/86
[ronin#85]: https://github.com/ronin-rb/ronin/issues/85
[ronin#84]: https://github.com/ronin-rb/ronin/issues/84
[ronin#83]: https://github.com/ronin-rb/ronin/issues/83
[ronin#82]: https://github.com/ronin-rb/ronin/issues/82
[ronin#81]: https://github.com/ronin-rb/ronin/issues/81
[ronin#80]: https://github.com/ronin-rb/ronin/issues/80
[ronin#79]: https://github.com/ronin-rb/ronin/issues/79
[ronin#78]: https://github.com/ronin-rb/ronin/issues/78
[ronin#77]: https://github.com/ronin-rb/ronin/issues/77
[ronin#76]: https://github.com/ronin-rb/ronin/issues/76
[ronin#75]: https://github.com/ronin-rb/ronin/issues/75
[ronin#74]: https://github.com/ronin-rb/ronin/issues/74
[ronin#73]: https://github.com/ronin-rb/ronin/issues/73
[ronin#69]: https://github.com/ronin-rb/ronin/issues/69
[ronin#68]: https://github.com/ronin-rb/ronin/issues/68
[ronin#67]: https://github.com/ronin-rb/ronin/issues/67
[ronin#66]: https://github.com/ronin-rb/ronin/issues/66
[ronin#65]: https://github.com/ronin-rb/ronin/issues/65
[ronin#64]: https://github.com/ronin-rb/ronin/issues/64
[ronin#63]: https://github.com/ronin-rb/ronin/issues/63
[ronin#62]: https://github.com/ronin-rb/ronin/issues/62
[ronin#60]: https://github.com/ronin-rb/ronin/issues/60
[ronin#46]: https://github.com/ronin-rb/ronin/issues/46
[ronin#45]: https://github.com/ronin-rb/ronin/issues/45
[ronin#44]: https://github.com/ronin-rb/ronin/issues/44

## The Future

After The Big Refactor is completed, I have plans to create additional new
Ronin libraries and tools for various tasks. This refactoring and re-organizing
of the dependencies should make the creation of new Ronin libraries and tools
much easier.

Here are some ideas:

* `ronin-vuln-sqli` - a small library similar to [ronin-vuln-lfi] and
  [ronin-vuln-rfi], but for testing SQL injection on URIs using [ronin-sql].
* `ronin-nmap` - allow automating [nmap] and importing scan files into
 [ronin-db].
* `ronin-masscan` - allow automating [masscan] and importing scan files into
  [ronin-db].
* `ronin-amass` - allow automating [amass] and importing scan files into
  [ronin-db].
* `ronin-nvd` - imports [NVD JSON feeds] and CVE data into [ronin-db].
* `ronin-wordlists` - a library for downloading and managing wordlists.
* `ronin-wordlist-builder` - a library for building wordlists from various
  sources.
* `ronin-ncrack` - allow automating `ncrack` and using `ronin-wordlists`.
* `ronin-brute` - a collection of credential bruteforcers using
  `ronin-wordlists`.
* `ronin-recon` - an extendable recon engine, that can also load custom
  rules.
* `ronin-scanner` - an extendable scanner that can load custom rules.
* `ronin-hub` - a web application to provides a web interface to all major
  ronin libraries and exposes the [ronin-db].

[nmap]: https://nmap.org/download.html
[masscan]: https://github.com/robertdavidgraham/masscan#readme
[amass]: https://github.com/OWASP/Amass#readme
[NVD JSON feeds]: https://nvd.nist.gov/vuln/data-feeds

## Conclusion

If you have made it this far and are interested in helping out, feel free to
join our [Discord] server and get in touch!

[Discord]: https://discord.gg/6WAb3PsVX9

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
[ronin-repos]: https://github.com/ronin-rb/ronin-repos#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme
[ronin-asm]: https://github.com/ronin-rb/ronin-sql#readme
[ronin-sql]: https://github.com/ronin-rb/ronin-sql#readme
[ronin-web-server]: https://github.com/ronin-rb/ronin-web-server#readme
[ronin-web-spider]: https://github.com/ronin-rb/ronin-web-spider#readme
[ronin-web-user_agents]: https://github.com/ronin-rb/ronin-web-user_agents#readme
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[ronin-vuln-lfi]: https://github.com/ronin-rb/ronin-vuln-lfi#readme
[ronin-vuln-rfi]: https://github.com/ronin-rb/ronin-vuln-rfi#readme
[ronin-post_ex]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-c2]: https://github.com/ronin-rb/ronin-c2#readme
[ronin-agent-node]: https://github.com/ronin-rb/ronin-agent-node#readme
[ronin-agent-php]: https://github.com/ronin-rb/ronin-agent-php#readme
[ronin-agent-ruby]: https://github.com/ronin-rb/ronin-agent-ruby#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin]: https://github.com/ronin-rb/ronin#readme

[XDG directories]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
