class StampRally < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :shop_participants #need to access all shops??

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true, length: { in: 2..50 }
  validates :description, length: { in: 5..300 }
end
