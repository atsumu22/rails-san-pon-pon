class AddLatitudeAndLongitudeToShopParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_participants, :latitude, :float
    add_column :shop_participants, :longitude, :float
  end
end
