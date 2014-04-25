class AddHeadlineToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :headline, :string
  end
end
