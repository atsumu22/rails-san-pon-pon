class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :category
      t.text :desctiption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
