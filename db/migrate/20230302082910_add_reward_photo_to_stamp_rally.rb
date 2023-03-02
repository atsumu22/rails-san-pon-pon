class AddRewardPhotoToStampRally < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_rallies, :photo, :string
  end
end
