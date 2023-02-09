class StampRally < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :shop_participants #need to access all shops??
end
