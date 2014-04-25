class AddHeartToMeme < ActiveRecord::Migration
  def change
    add_column :memes, :heart, :boolean
  end
end
