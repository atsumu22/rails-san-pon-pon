class AddColumnsToShopParticipant < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_participants, :status, :integer, default: 0
    add_column :stamp_rallies, :reward, :text
  end
end
