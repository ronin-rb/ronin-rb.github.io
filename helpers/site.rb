require 'yaml'

module Helpers
  module Site
    def config
      @config ||= YAML.load_file(File.join('_config.yml'))
    end

    def rsync_config
      config['rsync']
    end

    def rsync_options
      options = rsync_config['options']

      if rsync_config['excludes']
        options += rsync_config['excludes'].map do |pattern|
          "--exclude=#{pattern.to_s.dump}"
        end
      end

      return options.join(' ')
    end

    def rsync_dest(user=nil)
      rsync_config['dest']['host'] + ':' + rsync_config['dest']['path'] + '/'
    end
  end
end
