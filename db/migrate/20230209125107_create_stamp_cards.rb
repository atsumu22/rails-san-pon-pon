class CreateStampCards < ActiveRecord::Migration[7.0]
  def change
    create_table :stamp_cards do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :shop_participant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
