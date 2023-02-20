class AddCoordinatesToStampRallies < ActiveRecord::Migration[7.0]
  def change
    add_column :stamp_rallies, :latitude, :float
    add_column :stamp_rallies, :longitude, :float
  end
end
