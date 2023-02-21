class AddParticipantRefToStampCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :stamp_cards, :participant, null: false, foreign_key: true
  end
end
