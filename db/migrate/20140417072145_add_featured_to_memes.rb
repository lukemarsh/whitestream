class AddFeaturedToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :featured, :boolean, default: false
  end
end
