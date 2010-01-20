require 'yaml'
require 'thor'
require 'fileutils'

class Site < Thor

  include Thor::Actions

  default_task :build

  map '-b' => :build
  map '-c' => :clean
  map '-p' => :preview

  desc 'clean', 'Deletes a previously built site'
  def clean
    FileUtils.rm_rf www
  end

  desc 'build', 'Builds the website'
  def build
    invoke :clean

    run "jekyll #{site} #{www}"
  end

  desc 'preview', 'Previews the website'
  def preview
    run "jekyll #{site} #{www} --server"
  end

  desc 'publish', 'Publishes the built HTML'
  method_options :user => ENV['USER']
  def publish
    invoke :build

    say "Publishing site ..."
    run "rsync #{rsync_options} #{www} '#{rsync_dest(options[:user])}'"
    say "Site published."
  end

  desc 'cmp', 'Shows what will be published'
  method_options :user => ENV['USER']
  def cmp
    invoke :build

    say "Comparing site changes ..."
    run "rsync #{rsync_options} -n #{www} '#{rsync_dest(options[:user])}'"
  end

  protected

  def self.source_root
    File.expand_path(File.dirname(__FILE__))
  end

  def destination_root
    self.class.source_root
  end

  def site
    File.join(self.class.source_root,'site')
  end

  def www
    File.join(destination_root,'www')
  end

  def config
    @@config ||= YAML.load_file('config.yml')
  end

  def rsync
    config[:rsync]
  end

  def rsync_options
    options = rsync[:options]

    if rsync[:excludes]
      options += rsync[:excludes].map do |pattern|
        "--exclude=#{pattern.to_s.dump}"
      end
    end

    return options.join(' ')
  end

  def rsync_dest(user=nil)
    url = "#{rsync[:dest][:host]}:#{rsync[:dest][:path]}/"
    url = "#{user}@#{url}" if user

    return url
  end

end
