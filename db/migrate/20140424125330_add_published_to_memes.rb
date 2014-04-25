class AddPublishedToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :published, :boolean
  end
end
