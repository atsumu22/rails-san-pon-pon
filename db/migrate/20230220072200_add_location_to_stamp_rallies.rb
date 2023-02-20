class AddLocationToStampRallies < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_rallies, :location, :string
  end
end
