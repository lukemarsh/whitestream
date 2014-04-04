json.array!(@memes) do |meme|
  json.extract! meme, :id, :image
  json.url meme_url(meme, format: :json)
end
