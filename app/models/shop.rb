class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_participants, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, length: { in: 3..30 }
  validates :address, presence: true
  validates :category, presence: true
  validates :description, length: { in: 5..500 }

  # geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
