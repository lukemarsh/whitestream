class AddFieldsToMeme < ActiveRecord::Migration
  def change
    add_column :memes, :raw_image, :string
    add_column :memes, :top_line, :string
    add_column :memes, :bottom_line, :string
  end
end
