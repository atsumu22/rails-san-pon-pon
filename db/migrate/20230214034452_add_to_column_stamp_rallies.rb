class AddToColumnStampRallies < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_rallies, :attend_shops, :text
  end
end
