class StampRally < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :shop_participants #need to access all shops??
  has_many :stamp_card, dependent: :destroy
  has_one_attached :photo
  # serialize :attend_shops, Array

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true, length: { in: 5..50 }
  validates :description, length: { in: 10..300 }
  validates :reward, presence: true
  enum :reward, { stationary: 0,  sticker: 1, badge: 2, towel: 3, keyholder: 4 }

  # SEARCHBAR
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  # geocoder
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
