class StampCard < ApplicationRecord
  belongs_to :participant
  belongs_to :shop_participant

  validates :status, presence: true
  enum :status, { unstamped: 0, stamped: 1 }
end
