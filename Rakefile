# -*- ruby -*-

require 'helpers/site'

namespace :site do
  include Helpers::Site

  desc 'Cleans the www/ directory'
  task :clean do
    rm_rf 'www'
  end

  desc 'Builds the www/ directory'
  task :build => :clean do
    sh "jekyll"
  end

  desc 'Runs the site in preview mode'
  task :preview => :clean do
    sh "jekyll --auto --server"
  end
end

namespace :publish do
  desc 'Publishes the www/ directory'
  task :www, [:user] => 'site:build' do |t,args|
    sh "rsync #{rsync_options} www/ '#{rsync_dest(args.user)}'"
  end

  desc 'Performs a publishing dry-run of the site'
  task :dry_run, [:user] => 'site:build' do |t,args|
    sh "rsync #{rsync_options} -n www/ '#{rsync_dest(args.user)}'"
  end
end

desc 'Publishes the site'
task :publush, [:user] => 'publish:www'

task :default => 'site:build'

# vim: syntax=Ruby
