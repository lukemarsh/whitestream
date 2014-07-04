xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "World Edit RSS Feed"
    xml.description "A New News Site"
    xml.link memes_url

    @feeds.each do |meme|
      xml.item do
        xml.title meme.alt_tag
        if meme.article != ""
          xml.description meme.article
        end
        xml.pubDate meme.created_at.to_s(:rfc822)
        xml.link meme_url(meme)
        xml.guid meme_url(meme)
      end
    end
  end
end