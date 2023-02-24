class StampCard < ApplicationRecord
  belongs_to :participant
  belongs_to :stamp_rally
  serialize :shops_status, Hash

  validates :status, presence: true
  enum :status, { uncompleted: 0, completed: 1 }
end
