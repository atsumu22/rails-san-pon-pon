class AddHashToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_cards, :shops_status, :text, default: {}.to_yaml
  end
end
