class AddCategoryIconToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :category_icon, :string
  end
end
