class AddToColumnStampCard < ActiveRecord::Migration[7.0]
  def change
    remove_column :stamp_cards, :participant_id
  end
end
