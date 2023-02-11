class AddColumnToShopParticipants < ActiveRecord::Migration[7.0]
  def change
    remove_column :shop_participants, :status, :string
    add_column :shop_participants, :qr_code, :boolean, default: false
  end
end
