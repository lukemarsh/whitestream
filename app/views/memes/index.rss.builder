xml.rss 'xmlns:content' => 'http://purl.org/rss/1.0/modules/content/', 'xmlns:wfw' => 'http://wellformedweb.org/CommentAPI/', 'version' => '2.0' do
  xml.channel do
    xml.title "World Edit RSS Feed"
    xml.tag!("description") { xml.cdata!("A New New Site; For Us, By Us") }
    xml.link root_url
    xml.language 'en'

    @memes.each do |meme|
      xml.item do
        xml.title{ |xml| xml.cdata!(meme.top_line + ' - ' + meme.bottom_line)}
        xml.link meme_url(meme)
        xml.pubDate meme.created_at.to_s(:rfc822)
        xml.description{ |xml| xml.cdata!(meme.article)}
        xml.guid({:isPermaLink => "false"}, meme_url(meme))
        if meme.user
          xml.author meme.user.username
        else
          xml.author 'guest'
        end
      end
    end
  end
end