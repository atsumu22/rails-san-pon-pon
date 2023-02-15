class AddQrCodeToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_cards, :qr_code, :string
  end
end
