class AddColumnToStampRally < ActiveRecord::Migration[7.0]
  def change
    remove_column :stamp_rallies, :reward, :text
    add_column :stamp_rallies, :reward, :integer
  end
end
