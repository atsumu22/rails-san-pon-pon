class AddProfilePhotoToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :profile_photo, :string
    add_column :shops, :profile_description, :text
  end
end
