namespace :docs do
  LIBRARIES.each_key do |library|
    namespace :api do
      desc "Syncs the documentation for #{library}"
      task(library) do
        library_doc_dir = "docs/#{library}"

        if File.directory?(library_doc_dir)
          sh 'git', 'rm', '-r', library_doc_dir
        end

        sh 'cp', '-r', "../#{library}/doc", "#{library_doc_dir}"
        sh 'git', 'add',    library_doc_dir
        sh 'git', 'commit', library_doc_dir
      end
    end
  end
end

directory "docs/man"
file 'docs/man/index.md' => "docs/man" do
  File.open('docs/man/index.md','w') do |index|
    index.puts <<~YAML
      ---
      layout: page
      title: Docs - Man Pages
      ---

      # Man Pages

    YAML

    LIBRARIES.keys.sort.each do |library|
      man_page_paths = Dir.glob(File.join(ROOT,'..',library,'man','*.1.md')).sort
      next if man_page_paths.empty?

      man_page_links = man_page_paths.to_h do |man_page_path|
        man_page_name = File.basename(man_page_path,'.1.md')
        command_name  = man_page_name.sub("#{library}-","#{library} ")

        [command_name, man_page_name]
      end
      man_page_links.delete(library)

      index.puts <<~HTML
        ## #{library}

        * [#{library}](#{library}.1.html)
      HTML

      man_page_links.each do |command_name,man_page_name|
        index.puts "* [#{command_name}](#{man_page_name}.1.html)"
      end

      index.puts
    end
  end
end

LIBRARIES.each_key do |library|
  man_page_paths = Dir.glob(File.join(ROOT,'..',library,'man','*.1.md')).sort
  next if man_page_paths.empty?

  man_page_paths.each do |man_page_path|
    man_page_name = File.basename(man_page_path,'.1.md')
    markdown_page = "docs/man/#{man_page_name}.1.md"

    file(markdown_page => ["docs/man", man_page_path]) do
      markdown = File.read(man_page_path)

      # remove the header line
      markdown.sub!(/\A.+\n\n/,'')

      # rewrite the man-page links
      markdown.gsub!(/ronin-[^.)]+.1.md/) do |match|
        match.sub(/\.md\z/,'.html')
      end

      File.open(markdown_page,'w') do |file|
        file.puts <<~HEADER
          ---
          layout: page
          title: Docs - Man Pages - #{man_page_name}
          ---

          #{markdown}
        HEADER
      end
    end

    task "docs:man:#{library}" => markdown_page
  end

  desc "Generates man pages for #{library}"
  task "docs:man:#{library}"
  task 'docs:man' => "docs:man:#{library}"
end

desc "Generates all man pages for all libraries"
task 'docs:man' => 'docs/man/index.md'
