---
layout: default
title: "Hack This Zine #9 article - Ronin: Badger! Badger! Badger!"
---

# Hack This Zine #9 article - Ronin: Badger! Badger! Badger!

"Badger hates Society, and invitations, and dinner, and all that sort of thing."
- Kenneth Grahame, The Wind in the Willows, Ch. 3

Last issue we gave a general review of ruby, Ronin, Ronin overlays, and 
released a WordPress password brute forcing tool.  Since then, Ronin
has started to under go some changes, and the word press brute force tool has 
been revised.  In this article we will go over some of the changes happening
with Ronin and the smart brute forcer.

## Ronin is growing up

As the Ronin project is maturing design decisions are being made to simplify,
standardize, increase accessibility, and improve internal integration.  

Some code is getting completely cut from the code base such as the SQL DSL (Domain
Specific language) for generating SQL in Ronin::Code::SQL [1].  

The website ronin.rubyforge.org is getting re-written to make use of Jekyll [2], "a 
simple, blog aware, static site generator" as opposed to the custom xml based site.
This is being done because the tool is getting a lot of use by other 
developers, it is being actively supported, it supports
blog post generation, and handles markdown syntax [3] (being used by github.com, we.riseup.net,
and nearly every other web application written in ruby) to aid user 
contribution to documentation.  It also integrates nicely with ruby's WEBrick [4] for
live testing.  Another standardization project outside of Ronin, but also from
postmodern and related to exploit development, is ruby-yasm [5], a ruby interface
to the YASM assembler [6].  This will make it easy to generate shellcode for 
multiple different architectures file formats on the fly while developing payloads.  

The obvious downside for strong integration with other projects is when project
maintainers become unresponsive.  The upside, aside from having someone else 
maintain the dependency, is that it strengthens other projects through mutual 
aid and creates tangible human relationships within the software development 
community.  As anyone who has worked on a campaign that has existed for more
then a short period of time will tell you, sustainability depends on a shared
feeling of community and belonging.

Integration is not just happening with external libraries but with internal 
ones as well.  There are a few places in the Ronin code base where there
is duplicated effort.  The prime example here is the ronin-php library which
provides access to rfi and lfi vulnerability testing which really belongs in
ronin-exploits.  There is also planned integration of ronin-scanners, the library
for integrating with external tools like nmap [7], nikto [8], into 
ronin-int [9], the Ronin intelligence tool.

The Ronin intelligence gathering library is an exciting addition from the 
perspective of software based campaigns.  Security being the ever morphing
nightmare that it is can leave computers vulnerable to attacks one day and
secure the next.  A campaign, especially when being contributed to by multiple
developers, will need a way to collect and share information and notes on all relevant
assets of the campaign's targets.  Metasploit uses sqllite (not easily 
shareable) and can possibly make use of other DBMSs but would require a bit
of custom hacking, and CANVAS is totally inaccessible do to licensing price and
it being closed source.  Ronin-int has been around for a while, but will really 
become the red team Intranet blog in the next couple of months when it gets 
integrated with ronin-scanners.  Contributions to the ronin-int database can
be added by humans (comments on hosts or services, references to relevant propaganda,
or individuals and contact information related to the campaign's targets) or 
can be programmed (the output of an nmap or wikto scan possibly from multiple 
sources to pin point location based filters).  At a recent talk with postmodern
there was a good deal of discussion about how centralizing this type of 
data is a liability as a single point of failure if the 
central source is deleted, lost, or stolen.  To address this issue ronin-int
could make use AMQP [10] (a messaging protocol like XMPP (think Jabber /
Google Talk) with PubSub built in allowing notification of events 
(intelligence in this case) to all subscribed parties) [11].

The Ronin exploit library, ronin-exploits, has also been around for a while now but will have had 
a major overhaul by the time this goes to print.

Another postmodern creation, code name badger, roninRat, and libBERT, will provide
a rpc interface to computers it runs on.  This project will allow a standardized way to connect and add commands
to Ronin instances running on a server.  Badger is installed (dropped) on a server, will use ffi for arbitrary system library / file
inclusion, can connect back, or listen locally.  This component will handle
running commands, and accessing the local FS (essentially remote shell) using
BERT as the serialization mechanism.  

## Misc update and fails

There was a bit of work done to show off some of the exploit generation 
functionality of Ronin, but it did not get finished in time for this issue
so your just going to have to wait till the next issue.  There was however a 
feature added to spidr, a ruby web spidring library, that now allows for
spidering of sites being served as vhosts but without public DNS records. If
you remember from last issues article we wrote a "smart" word press password
brute forcing tool leveraging Ronin and a library call wordlist.  Wordlist
uses spidr on the backend.  Another side effect of this is that we can spidr
a server using the IP address and domain name without leaking dns requests
through the spidr library.  Run this all through privoxy and tor and you have
a properly anonymous password auditing tool [12]:

        smartBruteForceWP.rb -v -s 204.12.0.50 -hh test.com -px localhost:8118

References:
[1] Ronin SQL API reference - http://ronin.rubyforge.org/docs/ronin-sql/

[2] Jekyll is a simple, blog aware, static site generator - 
http://jekyllrb.com/

[3] Markdown syntax is a meta language for a meta language (HTML), but it is
a bit simpler then HTML - http://daringfireball.net/projects/markdown/syntax

[4] Gnome's Guide to WEBrick.  The best WEBrick documentation in existence, 
albiet with a few to many "So, <computer_programmer_explanation>" phrases.
http://microjet.ath.cx/webrickguide/html/html_webrick.html

[5] A Ruby interface to YASM - http://ruby-yasm.rubyforge.org/

[6] YASM - http://www.tortall.net/projects/yasm/

[7] NMAP is a feature rich port scanner - http://nmap.org/

[8] Nikto is a web server vulnerability scanner - http://cirt.net/nikto2

[9] ronin-int - https://github.com/postmodern/ronin-int

[10] AMQP is an open Internet Protocol for Business Messaging
http://www.amqp.org

[11] If you have ever had to program lisp and that last sentence just
gave you flashbacks, Im sorry.

[12] smartBruteForceWP.rb - https://hackbloc.org/svn/htz/8/smartBruteForceWP.rb
