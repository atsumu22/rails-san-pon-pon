class AddRewardIconToStampRally < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_rallies, :reward_icon, :string
  end
end
