class AddRewardColumnToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_cards, :reward_status, :integer, default: 0
  end
end
