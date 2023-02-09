class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string, default: "user" # or "chairman" or "participant"
    add_column :users, :name, :string
    add_column :users, :street_name, :string
    add_column :users, :location, :string
    add_column :users, :street_description, :text
  end
end
