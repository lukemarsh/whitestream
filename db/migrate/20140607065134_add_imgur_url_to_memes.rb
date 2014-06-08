class AddImgurUrlToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :imgur_url, :string
  end
end
