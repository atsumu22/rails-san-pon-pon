class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_participants
end
