class AddAddressToShopParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_participants, :address, :string
  end
end
