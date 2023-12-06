namespace :docs do
  LIBRARIES.each_key do |library|
    namespace :sync do
      desc "Syncs the documentation for #{library}"
      task(library) do
        library_doc_dir = "docs/#{library}"

        sh 'git', 'rm', '-r', library_doc_dir
        sh 'cp', '-r', "../#{library}/doc", "#{library_doc_dir}"
        sh 'git', 'add',    library_doc_dir
        sh 'git', 'commit', library_doc_dir
      end
    end
  end
end

LIBRARIES.each_key do |library|
  Dir.glob(File.join(__dir__,'..',library,'man','*.1.md')) do |man_page_path|
    man_page_name = File.basename(man_page_path,'.1.md')
    markdown_page = File.join('docs','man',library,"#{man_page_name}.1.md")

    file(markdown_page => man_page_path) do
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
    task 'docs:man' => markdown_page
  end
end
