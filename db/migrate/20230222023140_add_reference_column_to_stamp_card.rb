class AddReferenceColumnToStampCard < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stamp_cards, :shop_participant, null: false, foreign_key: true
    add_reference :stamp_cards, :stamp_rally, null: false, foreign_key: true
  end
end
