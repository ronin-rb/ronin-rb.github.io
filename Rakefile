# -*- ruby -*-

require 'helpers/site'

namespace :site do
  include Helpers::Site

  task :clean do
    rm_rf 'www'
  end

  task :build => :clean do
    sh "jekyll"
  end

  task :preview => :clean do
    sh "jekyll --auto --server"
  end
end

namespace :publish do
  task :www, [:user] => 'site:build' do |t,args|
    sh "rsync #{rsync_options} www/ '#{rsync_dest(args.user)}'"
  end

  task :dry_run, [:user] => 'site:build' do |t,args|
    sh "rsync #{rsync_options} -n www/ '#{rsync_dest(args.user)}'"
  end

  task :default => :www
end

task :default => 'site:build'

# vim: syntax=Ruby
