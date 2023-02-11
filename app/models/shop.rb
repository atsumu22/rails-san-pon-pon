class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_participants

  validates :name, presence: true, length: { in: 3..20 }
  validates :address, presence: true
  validates :category, presence: true
  validates :description, length: { in: 5..500 }
end
