# config/sitemap.rb
SitemapGenerator::Sitemap.default_host = 'http://www.worldedit.org'
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'


SitemapGenerator::Sitemap.create do
  Meme.find_each do |meme|
    add meme_path(meme), lastmod: meme.updated_at
  end
end

SitemapGenerator::Sitemap.ping_search_engines