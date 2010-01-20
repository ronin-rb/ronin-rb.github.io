require 'yaml'
require 'thor'

class Site < Thor

  include Thor::Actions

  default_task :build

  desc 'build', 'Builds the website'
  def build
    run "jekyll #{SITE_DIR} #{WWW_DIR}"
  end

  desc 'preview', 'Previews the website'
  def preview
    run "jekyll #{SITE_DIR} #{WWW_DIR} --server"
  end

  desc 'publish', 'Publishes the built HTML'
  def publish
    invoke :build

    say "Publishing site ..."
    run "rsync #{rsync_options} #{WWW_DIR} '#{rsync_dest}'"
    say "Site published."
  end

  desc 'cmp', 'Shows what will be published'
  def cmp
    invoke :build

    say "Comparing site changes ..."
    run "rsync #{rsync_options} -n #{WWW_DIR} '#{rsync_dest}'"
  end

  protected

  SITE_DIR = 'site'
  WWW_DIR = 'www'

  def config
    @@config ||= YAML.load_file('config.yaml')
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

  def rsync_dest
    "#{rsync[:dest][:host]}:#{rsync[:dest][:path]}/"
  end

end
