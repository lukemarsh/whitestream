class RemoveHeartFromMemes < ActiveRecord::Migration
  def change
    remove_column :memes, :heart, :boolean
  end
end
