require 'yaml'

root      = File.expand_path('../',__FILE__)
config    = YAML.load_file(File.join(root,'_config.yml'))
libraries = config['libraries']

namespace :docs do
  libraries.each_key do |library|
    namespace :sync do
      desc "Syncs the documentation for #{library}"
      task(library) do
        sh "rsync -rv --delete-after ../#{library}/doc/ docs/#{library}/"
      end
    end
  end
end
