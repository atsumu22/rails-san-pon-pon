class AddColumnToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :stamp_cards, :participant, null: false, foreign_key: true
    remove_column :stamp_cards, :qr_code
    add_column :shop_participants, :qr_code, :string
  end
end
