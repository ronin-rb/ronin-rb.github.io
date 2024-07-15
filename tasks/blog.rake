namespace :blog do
  desc 'Create a new blog post'
  task :new_post, [:title] do |t,args|
    date   = Date.today
    title  = args.title
    author = ENV['USER']

    slug = title.sub(/[[:punct:]]$/,'').gsub(/[^a-zA-Z0-9]+/,'-')
    path = File.join('blog','_posts',"#{date}-#{slug}.md")

    contents = <<~BLOG_POST
      ---
      layout: post
      title: #{title}
      author: #{author}
      tags:
        - FIXME
      ---
    BLOG_POST

    File.write(path,contents)
    puts "Created #{path}"
  end

  desc "Create a new 'release' blog post"
  task :new_release, [:title] do |t,args|
    date   = Date.today
    title  = args.title
    author = ENV['USER']

    slug = title.chomp('!').gsub(/[^a-zA-Z0-9]+/,'-')
    path = File.join('blog','_posts',"#{date}-#{slug}.md")

    contents = <<~BLOG_POST
      ---
      layout: post
      title: #{title}
      author: #{author}
      tags:
        - release
      ---

      [ronin-FIXME][ronin-FIXME] [X.Y.Z][ronin-FIXME-X.Y.Z] has been released.

      ## How To Update

      ### Gems

      To only update [ronin-FIXME] to [X.Y.Z][ronin-FIXME-X.Y.Z], simply run:

      ```shell
      gem update ronin-FIXME
      ```

      ### Docker

      {% include docker_update.md %}

      ### Snap

      {% include snap_update.md %}

      [ronin-FIXME]: https://github.com/ronin-rb/ronin-FIXME#readme
      [ronin-FIXME-X.Y.Z]: https://github.com/ronin-rb/ronin-FIXME/releases/tag/vX.Y.Z
    BLOG_POST

    File.write(path,contents)
    puts "Created #{path}"
  end
end
