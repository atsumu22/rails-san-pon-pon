class AddDefaultToAttendShopsInStampRallies < ActiveRecord::Migration[7.0]
  def change
    remove_column :stamp_rallies, :attend_shops
    add_column :stamp_rallies, :attend_shops, :text, default: [], array:true
  end
end
