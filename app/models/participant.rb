class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :stamp_rally
  has_many :shop_participants, through: :stamp_card
end
