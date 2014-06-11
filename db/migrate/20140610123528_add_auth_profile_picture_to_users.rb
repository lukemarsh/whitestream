class AddAuthProfilePictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_profile_picture, :string
  end
end
