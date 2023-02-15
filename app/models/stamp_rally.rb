class StampRally < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :shop_participants #need to access all shops??
  # serialize :attend_shops, Array

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true, length: { in: 5..50 }
  validates :description, length: { in: 10..300 }
end
