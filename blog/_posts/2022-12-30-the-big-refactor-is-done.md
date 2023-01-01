---
layout: post
title: The Big Refactor is DONE!
author: postmodern
tags:
 - refactor
 - ronin-support
 - ronin-core
 - ronin-repos
 - ronin-db
 - ronin-db-activerecord
 - ronin-code-asm
 - ronin-code-sql
 - ronin-web-server
 - ronin-web-spider
 - ronin-web-user_agents
 - ronin-web
 - ronin-vulns
 - ronin-post_ex
 - ronin-payloads
 - ronin-exploits
 - ronin-fuzzer
 - ronin
---

After nearly a full year of non-stop development since the initial
[announcement of The Big Refactor][1], 4153 commits and
[700 closed issues][2] later, The Big Refactor is *finally* DONE!

Here is what happens next:

1. All development branches will be merged into the `main` branch.
2. Pre-release versions will be tagged and released for all Ronin repositories.
3. Beta testing of the pre-release versions will begin. A blog post with
   instructions on how to install the beta versions and participate in the beta
   testing will also be published.
4. Subsequent pre-release or release candidate versions may be released based
   on beta testing feedback.
5. Once all issues that have been spotted during beta testing have been fixed,
   stable versions for all Ronin repositories will be released.

Note that during beta testing, a feature freeze will be in effect.
Any new feature ideas or suggestions will be postponed/queued until the next
minor version release for that Ronin gem.

[1]: /blog/2022/01/29/announcing-the-big-refactor.html
[2]: https://github.com/orgs/ronin-rb/projects/2
