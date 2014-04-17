class AddArticleToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :article, :text
  end
end