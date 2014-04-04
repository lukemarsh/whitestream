class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :image

      t.timestamps
    end
  end
end
