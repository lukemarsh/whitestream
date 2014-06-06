class AddColourToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :colour, :string
  end
end
