atom_feed do |feed|
  feed.title = "My Blog Posts"
  feed.updated @feeds.maximum(:created_at)
  @feeds.each do |meme|
    feed.entry meme, published: meme.created_at do |entry|
      entry.title meme.alt_tag
      if meme.article != ""
        entry.content meme.article
      end
      if meme.user
        entry.author do |author|
          author.name meme.user.username
        end
      end
    end
  end
end