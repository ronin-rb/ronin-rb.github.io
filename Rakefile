require 'yaml'

namespace :site do
  SITE_DIR = 'site'

  WWW_DIR = 'www'

  CONFIG = YAML.load_file('config.yaml')

  def rsync
    CONFIG[:rsync]
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

  def rsync_dest
    "#{rsync[:dest][:host]}:#{rsync[:dest][:path]}/"
  end

  desc "Builds the website"
  task :build do
    sh "jekyll #{SITE_DIR} #{WWW_DIR}"
  end

  desc "Previews the website"
  task :preview do
    sh "jekyll #{SITE_DIR} #{WWW_DIR} --server"
  end

  desc "Publishes the built HTML"
  task :publish => :build do
    puts "[-] Publishing website ..."
    sh "rsync #{rsync_options} #{WWW_DIR} '#{rsync_dest}'"
  end

  desc "Shows what will be published"
  task :cmp => :build do
    puts "[-] Comparing website changes ..."
    sh "rsync #{rsync_options} -n #{WWW_DIR} '#{rsync_dest}'"
  end
end

desc "Build the html by default"
task :default => 'site:build'
