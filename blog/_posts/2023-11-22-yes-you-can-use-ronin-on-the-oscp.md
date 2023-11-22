---
layout: post
author: postmodern
title: Yes, you can use Ronin on the OSCP
tags:
  - ronin
  - oscp
---

Many who have taken or are studying for the [OSCP Exam] know that you are
not allowed to use Metasploit on the exam, except for one challenge.
This is because the OSCP [exam restrictions] forbid the use of any
"automatic exploitation" tools (ex: Metasploit, SQLmap, etc).
Such tools are considered "automatic exploitation" tools because they can
automatically find *and* exploit vulnerabilities without any user interaction
(ex: Metasploit's `db_autopwn` command). The purpose of the [OSCP Exam] is to
test how well you can find and exploit vulnerabilities on your own,
not how well you can use `db_autopwn`.

However, Ronin does not provide any "automatic exploitation" functionality,
which can scan, fingerprint services, identify vulnerabilities, *and* exploit
them, automatically without *any* user interaction. Instead, using Ronin one
would have to perform each step manually with [ronin-vulns], [ronin-payloads] /
[ronin-exploits], etc.

Just to be sure, I emailed the OSCP staff and asked for clarification on what
is and is not considered "automatic exploitation"; for example is running a
Python exploit considered "automatic exploitation"?

Here is their response:

```
Subject: [OffSec] Re: clarification on banned tools
From: Support <challenges@offensive-security.com>

##- Please type your reply above this line -##

Hi Postmodern,
This message (287391) has been updated. To add additional comments, please reply to this email.

----------------------------------------------

Offensive Security, Nov 9, 2023, 08:24 UTC

Hello,

Thank you for your email.

If a tool is capable of automatically discovering and exploiting vulnerabilities on a target machine resulting in automatic remote access or
escalated privileges without effort or enumeration, it can be considered a restricted tool.

To further elaborate on the above, we highly recommend reading the below blog post regarding automated exploitation tools.
- Understanding the tools/scripts you use in a Pentest

Furthermore, please also keep in mind that there are many tools and unfortunately, we are unable to comment on all of them.
Therefore, it is up to the student to determine if their chosen tool or script falls under a restricted category.
This also demonstrates that you understand what the tool is doing and how it works.

Keep us updated if you require any additional information.

Sincerely,
The OffSec Team
www.offsec.com
```

So yes, you *can* use Ronin on the [OSCP Exam], because it does not provide any
"automatic exploitation" features and forces you to think about what steps you
want to perform.

[OSCP Exam]: https://www.offsec.com/courses/pen-200/
[exam restrictions]: https://help.offsec.com/hc/en-us/articles/360040165632-OSCP-Exam-Guide#exam-restrictions
[ronin-vulns]: https://github.com/ronin-rb/ronin-vulns#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme
[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
