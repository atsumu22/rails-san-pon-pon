class CreateShopParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_participants do |t|
      t.references :stamp_rally, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.string :status, default: "empty"
      # t.boolean :qr_code, default: false <- this way!!!!

      t.timestamps
    end
  end
end
