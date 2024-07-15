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
