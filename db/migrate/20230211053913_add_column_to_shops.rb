class AddColumnToShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :desctiption, :text
    add_column :shops, :description, :text
  end
end
