class StampCard < ApplicationRecord
  belongs_to :participant
  belongs_to :stamp_rally
  serialize :shops_status, Hash

  validates :status, presence: true
  enum :status, { uncompleted: 0, completed: 1 }
  validates :reward_status, presence: true
  enum :reward_status, { unacquired: 0, acquired: 1, used: 2 }
end
