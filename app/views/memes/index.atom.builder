xml.feed do |feed|
  feed.title = "My Blog Posts"
  feed.updated @feed.maximum(:updated_at)
  @feed.each do |meme|
    feed.entry meme, published: meme.created_at do |entry|
      entry.title meme.top_line
      entry.content meme.article
      entry.author do |author|
        author.name article.user.username
      end
    end
  end
end