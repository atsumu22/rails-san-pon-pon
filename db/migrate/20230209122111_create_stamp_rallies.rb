class CreateStampRallies < ActiveRecord::Migration[7.0]
  def change
    create_table :stamp_rallies do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
