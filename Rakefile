require 'yaml'
require 'fileutils'

namespace :web do
  CONFIG = YAML.load_file('config.yaml')

  def xml(page)
    File.join('xml',"#{page}.xml")
  end

  def www(page=nil)
    if page
      File.join('www',"#{page}.html")
    else
      File.join('www','')
    end
  end

  def project
    CONFIG[:project]
  end

  def pages
    CONFIG[:pages]
  end

  def symlinks
    (CONFIG[:symlinks] || {})
  end

  def xslt_options(page)
    options = ['--xinclude', '--stringparam', 'page', xml(page)]

    CONFIG[:project].each do |name,value|
      options += [
        '--stringparam',
        'project-' + name.to_s.downcase.gsub(/[_-]/,'-'),
        value.to_s.dump
      ]
    end

    return options.join(' ')
  end

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

  def xslt(src,dest=src)
    system "xsltproc #{xslt_options(src)} -o #{www(dest)} #{xml(src)}"
  end

  def symlink(src,dest)
    src = File.join('www',src)

    FileUtils.ln_sf(dest,src)
  end

  desc "Builds the HTML"
  task :html do
    pages.each do |page|
      puts "[-] Translating #{page}.xml ..."

      break unless xslt(page)
    end
  end

  desc "Build symlinks for old links"
  task :symlinks do
    symlinks.each do |src,dest|
      puts "[-] Symlinking #{src} -> #{dest} ..."

      symlink(src,dest)
    end
  end

  desc "Builds the website"
  task :build => [:html, :symlinks]

  desc "Publishes the built HTML"
  task :publish => :build do
    puts "[-] Publishing website ..."
    sh "rsync #{rsync_options} #{www} '#{project[:user]}@#{project[:host]}:#{project[:webroot]}/'"
  end

  desc "Shows what will be published"
  task :test => :build do
    puts "[-] Comparing website changes ..."
    sh "rsync #{rsync_options} -n #{www} '#{project[:user]}@#{project[:host]}:#{project[:webroot]}/'"
  end
end

desc "Build the html by default"
task :default => 'web:build'
