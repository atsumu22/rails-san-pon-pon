class AddStatusToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_cards, :status, :integer, default: 0
    remove_column :shop_participants, :status, :integer, default: 0
  end
end
