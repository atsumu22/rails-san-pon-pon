class RemoveParticipantToStampCard < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stamp_cards, :participant, null: false, foreign_key: true
  end
end
