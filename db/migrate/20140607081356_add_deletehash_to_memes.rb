class AddDeletehashToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :deletehash, :string
  end
end
