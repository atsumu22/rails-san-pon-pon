class AddPhotoToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :photo, :string
  end
end
