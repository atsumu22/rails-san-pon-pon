class AddColumnToShopParticipant < ActiveRecord::Migration[7.0]
  def change
    remove_column :shop_participants, :qr_code, :boolean
    add_column :shop_participants, :status, :integer, default: 0
  end
end
