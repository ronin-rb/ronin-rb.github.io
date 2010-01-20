---
layout: default
title: Git and GitHub
---

Ronin and Git[Hub]
==================

Ronin development colaboration is done with the [git](http://git-scm.com/)
source code management (SCM) system. [github.com](http://github.com/)
is used to host the authortive remote repositories.  By creating a github
account and forking one of the ronin projects for your development needs,
you will be integrating into the ronin development community.
This will allow core Ronin developers to use git and github to accept
contributions.

There is a [plethora of documentation](http://www.google.com/search?q=git+and+github)
for getting up to speed with git.  It can be difficult to weed through
documentation for a tool as robust and generic as git and find the few
details relavant to get started hacking on ronin. Below is a brief guide for
using github and git for working on Ronin.

Setting up a github.com account
-------------------------------

This consists of installing git on your system, creating an
account on github.com, associating your git installation with
your github.com account, and uploading your ssh public-key
to github.com.

Each of these steps are pretty straight forward.  Install git
in same fashion as you would for other applications on your
system (apt-get, yum, etc on Linux,
[OS X docs](http://github.com/guides/get-git-on-mac),
[Windows docs](http://github.com/guides/using-git-and-github-for-the-windows-for-newbies)).

The github.com account can be created
[here](https://github.com/signup/free),
associating your git installation with github.com is documented
[here](http://github.com/guides/tell-git-your-user-name-and-email-address),
and getting your ssh public-key onto github.com is documented
[here](http://github.com/guides/providing-your-ssh-key)

The authoritive source of documentation for using git with github.com is
available [here](http://github.com/guides/home).

Forking Ronin
-------------

_Forking_ a project is a git-ism for making a copy of a source
code project that can be tracked through github. An initial fork
of a project is a copy at the point in time that the form was 
made.  If you want to keep your fork in sync with commits from 
the origionally forked project you will have to do some 
additional configuration of your local client.  Forking and 
staying in sync with the origional project is well documented
[here](http://github.com/guides/keeping-a-git-fork-in-sync-with-the-forked-repo).

In this example the github.com user is evoltech.
checkout your fork of ronin:

    $ git clone git@github.com:evoltech/ronin.git

Add postmoderns (the authoritive ronin repository) remote repository:

    $ git remote add postmodern git://github.com/postmodern/ronin.git

__Note:__ Remote repositories which one has write access to will begin with
`git@github.com` and are accessed over ssh. Remote repositories
beginning with `git://` will not allow write access and are
accessed over HTTP.

Update (pull) updates from postmoderns repository:

    $ git pull postmodern

Git Workflow
------------

Now that you have your own fork of ronin you can hack on it to  your hearts
content.  You can commit your changes (saving them locally with messages
about the changes), push them to your remote fork, create branches, and
notify postmodern (or other ronin developers) about new features and bug
fixes you have made.

While working on ronin you may make changes to a number of files
that implement different features or fix bugs. Each of these
can be tracked by committing them with a message. Committing
is only relevant to the local clone of your remote fork.

    $ git commit -m "Fixed bug preventing file inclusion in overlays" lib/ronin/platform/extension.rb

You can view all of the files that were modified and the files
which are queued up to be committed using the `git status` command.

In the event that you have made changes to multiple files accross several
different directories, you can queue the files for a commit using the
`git add` command:

    $ cd lib/ronin/formatting/extensions
    $ git add binary/integer.rb
    $ git add binary/string.rb
    $ git add text/array.rb
    $ git commit

Now that you have finished up for the day and you want to push your
changes up to github; because you might be working from a different
machine tomorrow, or maybe because you just need a backup.

    $ git push origin

Now a couple days have passed and you are pumped because you fixed like 20
bugs (a totally hypothetical situation since Agile programming reduces bug
build-up) and added a sick new feature for
[hacking the gibson](http://www.youtube.com/watch?v=x3XzPhdBx9g).

Problem is that it is 9am and you want to start working on a totally
different feature that cannot be finished till some time next week. What
you will need to do is create a branch for the new feature.

    $ git checkout -b awesome
    ... hack hack hack ...
    $ git push origin awesome

The `-b` option will cause `git checkout` to create a new branch, and 
then switch to it.

When your awesome new feature is complete and all tested, you can merge
your awesome branch back into the master branch.

    $ git checkout master
    $ git merge awesome

Then follow the [pull request documentation](http://github.com/guides/pull-requests),
providing a summary of your bug fixes and any new features. Once notified,
the other developers of Ronin can then pull in your changes into the
main Ronin repository, preserving your author information and commit
messages.

References
----------

Here are a few links to references that may be useful to new git and
github.com users.

* [learn.github.com](http://learn.github.com/) - Excellent source for
  screencasts about Git and GitHub.
* [Getting the Hang of GitHub](http://net.tutsplus.com/tutorials/other/getting-the-hang-of-github/).
* [Terminal, Git, and GitHub for the Rest of Us: Screencast](http://net.tutsplus.com/videos/screencasts/terminal-git-and-github-for-the-rest-of-us-screencast/).
* [Git Cheat Sheet](http://zrusin.blogspot.com/2007/09/git-cheat-sheet.html)
  - A totally sweet visual representation of working with git.
* [Git Tutorial](http://datamapper.github.com/using-git.html) - An indepth
  tutorial from the Ruby Datamapper project.

