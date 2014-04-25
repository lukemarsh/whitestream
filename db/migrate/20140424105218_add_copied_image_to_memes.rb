class AddCopiedImageToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :copied_image, :string
  end
end
