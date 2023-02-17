class ChangeDateTypeForDate < ActiveRecord::Migration[7.0]
  def change
    change_column :stamp_rallies, :start_date, :date
    change_column :stamp_rallies, :end_date, :date
  end
end
