class ShopParticipant < ApplicationRecord
  belongs_to :stamp_rally
  belongs_to :shop

  validates :status, presence: true
  enum :status, { unstamped: 0, stamped: 1 }

   # geocoder
   geocoded_by :address
   after_validation :geocode, if: :will_save_change_to_address?
end
