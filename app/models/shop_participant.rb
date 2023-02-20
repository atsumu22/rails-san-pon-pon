class ShopParticipant < ApplicationRecord
  belongs_to :stamp_rally
  belongs_to :shop
  has_many :stamp_cards
end
