class StampCard < ApplicationRecord
  belongs_to :participant
  belongs_to :shop_participant
end
