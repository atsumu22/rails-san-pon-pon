class StampCard < ApplicationRecord
  # belongs_to :participant
  belongs_to :shop_participant
  validates :qr_code, presence: true
end
