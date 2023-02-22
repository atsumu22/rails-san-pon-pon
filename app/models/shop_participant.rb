class ShopParticipant < ApplicationRecord
  belongs_to :stamp_rally
  belongs_to :shop

  validates :status, presence: true
  enum :status, { unstamped: 0, stamped: 1 }
end
