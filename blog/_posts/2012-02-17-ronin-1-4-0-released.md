---
layout: post
title: Ronin 1.4.0 released
author: postmodern
---

After many months of development and release candidates I am pleased to announce
that [ronin-support][28] [0.4.0][1], [ronin][29] [1.4.0][2] and
[ronin-gen][30] [1.1.0][3] have been released.

    gem update ronin-support ronin ronin-gen

So what's new?

## ronin-support 0.4.0

### Common Regular Expressions

Many common and useful Regular Expressions constants were added to the
[Regexp][4] class.

{% highlight ruby %}
"Please see C:\\Documents\\plans.docx".scan(Regexp::ABSOLUTE_WINDOWS_PATH)
# => ["C:\\Documents\\plans.docx"]
{% endhighlight %}

### New String methods

[String#repeating][5] was added which allows creating multiple repeating
Strings:

{% highlight ruby %}
'A'.repeating((100..700).step(100)) { |str| puts str }
{% endhighlight %}

[String#sql_inject][6] was also added, allowing for easy formatting of SQL
injections:

{% highlight ruby %}
"'1' OR 1=1".sql_inject(:terminate => true)
# => "1' OR 1=1 --"
{% endhighlight %}

### Base64 formatting

[String#base64_encode][15] and [String#base64_decode][16] now accept formatting
arguments:

{% highlight ruby %}
("A" * 256).base64_encode(:strict)
# => "QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQQ=="
{% endhighlight %}

{% highlight ruby %}
"hello world".base64_encode(:url)
# => "aGVsbG8gd29ybGQ="
{% endhighlight %}

These base64 formats are similar to the new methods added to the
[Base64][17] module in Ruby 1.9.

### ronin/fuzzing

All fuzzing methods were moved into `ronin/fuzzing` and the [Ronin::Fuzzing][8]
namespace. [Ronin::Fuzzing][8] was added which contains fuzzing generator
methods, which generate various types of malicious data. These methods can be
called directly ...

{% highlight ruby %}
Fuzzing.format_strings { |fmt| puts fmt }
{% endhighlight %}

... or accessed as Enumerators:

{% highlight ruby %}
Fuzzing[:bad_strings]
# => #<Enumerator: Ronin::Fuzzing:bad_strings>
{% endhighlight %}

The fuzzing generator methods can also be used with [String#fuzz][9]:

{% highlight ruby %}
"GET /sign_in".fuzz(:unix_path => :bad_paths) { |str| p str }
{% endhighlight %}

[String#mutate][7] was also added to `ronin/fuzzing`, which allows for the
incremental mutating of a String, given patterns and substitutions.

{% highlight ruby %}
"hello old dog".mutate('e' => ['3'], 'l' => ['1'], 'o' => ['0']) { |str| puts str }
{% endhighlight %}

### New Wordlist class

[Ronin::Wordlist][10] is a class for building and working with wordlists.

Use an existing Wordlist file:

{% highlight ruby %}
wordlist = Wordlist.new('passwords.txt')
wordlist.each { |word| puts word }
{% endhighlight %}

Expand a Wordlist with mutation rules:

{% highlight ruby %}
wordlist = Wordlist.new('passwords.txt', /e/ => ['E', '3'], /a/ => ['@'])
wordlist.each { |word| puts word }
{% endhighlight %}

Build a Wordlist from arbitrary text:

{% highlight ruby %}
wordlist = Wordlist.build(text)
wordlist.each_n_words(3) { |words| puts words }
{% endhighlight %}

### Network modules

As of [ronin-support][28] 0.4.0 all `Net` convenience methods have been moved 
into their respective modules in the [Network][11] namespace. One can add the 
Network convenience methods to any Class/Module by simply including a Network
module:

{% highlight ruby %}
require 'ronin/network/http'

class WordpressFingerprinter

  include Ronin::Network::HTTP

  attr_accessor :host

  PATH = '/wp-includes/js/tinymce/tiny_mce.js'

  # @see http://tools.sucuri.net/?page=docs&title=fingerprinting-web-apps
  VERSIONS = {
    'a306a72ce0f250e5f67132dc6bcb2ccb' => '2.0',
    '4f04728cb4631a553c4266c14b9846aa' => '2.1',
    '25e1e78d5b0c221e98e14c6e8c62084f' => '2.2',
    '83c83d0f0a71bd57c320d93e59991c53' => '2.3',
    '7293453cf0ff5a9a4cfe8cebd5b5a71a' => '2.5',
    '61740709537bd19fb6e03b7e11eb8812' => '2.6',
    'e6bbc53a727f3af003af272fd229b0b2' => '2.7',
    'e6bbc53a727f3af003af272fd229b0b2' => '2.7.1',
    '128e75ed19d49a94a771586bf83265ec' => '2.9.1'
  }

  def version
    VERSIONS[http_get_body(:host => @host, :path => PATH).md5]
  end

end
{% endhighlight %}

Additionally, all Network modules are included into the [Ronin::Support][26]
and [Ronin][27] namespaces, so no more having to type "`Net.`":

    >> tcp_banner 'smtp.gmail.com', 25
    => "220 mx.google.com ESMTP g3sm14650755pbt.41"

### Network::DNS

[Network::DNS][12] was added, which provides simple DNS methods for Ronin.

{% highlight ruby %}
dns_lookup 'google.com'
# => "74.125.224.65"
{% endhighlight %}

{% highlight ruby %}
dns_lookup_all 'google.com'
# => ["74.125.224.128", "74.125.224.131", "74.125.224.130", "74.125.224.136", "74.125.224.132", "74.125.224.129", "74.125.224.142", "74.125.224.133", "74.125.224.137", "74.125.224.134", "74.125.224.135"]
{% endhighlight %}

{% highlight ruby %}
dns_reverse_lookup '74.125.224.65'
# => "nuq04s07-in-f1.1e100.net"
{% endhighlight %}

### New Network Mixins

[Network::Mixins::DNS][13] and [Network::Mixins::SSL][14] were also added.

## ronin 1.4.0

### Refactored Ronin::UI::CLI::Command

In [ronin][29] 1.4.0 [Ronin::UI::CLI::Command][18] (the base-class for all CLI
commands) was refactored to no longer use the [Thor][19] library.
Now the Command class uses [Parameters::Options][20], which combines the
[Parameters][21] library with Ruby's builtin [OptionParser][22] module.

What resulted from this refactoring was cleaner option syntax and better
`--help` output. Take for example the [Wordlist] command:

{% highlight ruby %}
class Wordlist < Command
    
  summary 'Builds and/or mutates Wordlists'

  option :input, :type        => String,
                 :flag        => '-i',
                 :usage       => 'FILE',
                 :description => 'Input file'

  option :output, :type        => String,
                  :flag        => '-o',
                  :usage       => 'PATH',
                  :description => 'Output wordlist file'

  option :mutations, :type         => Hash[String => Array],
                     :default      => {},
                     :flag         => '-m',
                     :usage        => 'STRING:SUB',
                     :descriptions => 'Mutations rules'

  argument :template, :type        => Array,
                      :description => 'Options word template'

  def execute
    # ...
  end

end
{% endhighlight %}

Which produces the following `--help` output:

    Usage: ronin wordlist [options] TEMPLATE
    
    Options:
        -v, --[no-]verbose               Enable verbose output.
        -q, --[no-]quiet                 Disable verbose output.
            --[no-]silent                Silence all output.
            --[no-]color                 Enables color output.
        -i, --input [FILE]               Input file.
        -o, --output [PATH]              Output wordlist file.
        -m, --mutations [STRING:SUB]     Default: {}
    
    Arguments:
        TEMPLATE                         Options word template
    
    Builds and/or mutates Wordlists

It really is that easy to write your own Ronin commands.

### Old commands, new again

The `ronin` `install`, `update` and `uninstall` commands have been brought back
in 1.4.0.

    $ ronin install https://github.com/user/repo.git

The `ronin repos` command now only lists installed Repositories.

### Ronin Console .commands

After playing with [Node.js][31], I liked how `node` console commands were
prefixed with a `.` character (ex: `.load`). The `.command` syntax also does
not conflict with Ruby's syntax. In 1.4.0 all `!command`s can also be called
as `.command`s in the Ronin Console:

    >> .edit myscript.rb
    => true
    >> .ping www.google.com
    ...

## ronin-gen 1.1.0

### Ronin::Gen::Generator refactored

In [ronin-gen][30] 1.1.0, [Ronin::Gen::Generator][23] (the base-class of all
generators) was also refactored to no longer use the [Thor][19] library.
Instead, all Generators use the [Parameters][21] library with Ruby's builtin
[FileUtils][24] module. This change lowers the barrier for writing custom
Ronin Generators.

For an example of the new Generator syntax, please see the [Repository][25]
generator class.

### Improved ronin-gen command

The `ronin-gen` command now uses [Parameters::Options][20] to directly parse
options for the selected Generator. This also improved the `--help` output
for all Generators:

    $ ronin-gen repository --help
    ronin-gen repository PATH [options]
            --path [PATH]                The destination path.
            --title [TITLE]
            --uri [URI]
            --source [SOURCE]
            --website [WEBSITE]
            --license [LICENSE]          Default: "CC-by"
            --description [DESCRIPTION]  Default: "This is a Ronin Repository"
            --authors [AUTHORS [...]]    Default: []
            --[no-]tests
            --[no-]docs
            --[no-]svn                   Create a SVN repository.
            --[no-]git                   Create a Git repository.
            --[no-]hg                    Create a Hg repository.

### Generate SVN, Git, Hg Repositories

The [Repository][25] generator now supports generating SVN, Git and Hg
repositories:

    $ ronin-gen repository myrepo --title "My Repository" --hg

[1]: /docs/ronin-support/file.ChangeLog.html
[2]: /docs/ronin/file.ChangeLog.html
[3]: /docs/ronin-gen/file.ChangeLog.html
[4]: /docs/ronin-support/Regexp.html
[5]: /docs/ronin-support/String.html#repeating-instance_method
[6]: /docs/ronin-support/String.html#sql_inject-instance_method
[7]: /docs/ronin-support/String.html#mutate-instance_method
[8]: /docs/ronin-support/Ronin/Fuzzing.html
[9]: /docs/ronin-support/String.html#fuzz-instance_method
[10]: /docs/ronin-support/Ronin/Wordlist.html
[11]: /docs/ronin-support/Ronin/Network.html
[12]: /docs/ronin-support/Ronin/Network/DNS.html
[13]: /docs/ronin-support/Ronin/Network/Mixins/DNS.html
[14]: /docs/ronin-support/Ronin/Network/Mixins/SSL.html
[15]: /docs/ronin-support/String.html#base64_encode-instance_method
[16]: /docs/ronin-support/String.html#base64_decode-instance_method
[17]: http://rubydoc.info/stdlib/base64/1.9.2/frames
[18]: /docs/ronin/Ronin/UI/CLI/Command.html
[19]: https://github.com/wycats/thor#readme
[20]: http://rubydoc.info/gems/parameters/0.4.0/Parameters/Options
[21]: http://rubydoc.info/gems/parameters/0.4.0/file/README.md
[22]: http://rubydoc.info/stdlib/optparse/1.9.2/OptionParser
[23]: /docs/ronin-gen/Ronin/Gen/Generator.html
[24]: http://rubydoc.info/stdlib/fileutils/1.9.2/file/README.rdoc
[25]: /docs/ronin-gen/Ronin/Gen/Generators/Repository.html
[26]: /docs/ronin-support/Ronin/Support.html
[27]: /docs/ronin/Ronin.html
[28]: /docs/ronin-support/
[29]: /docs/ronin/
[30]: /docs/ronin-gen/
[31]: http://nodejs.org/
