class StampCard < ApplicationRecord
  belongs_to :participant
  belongs_to :stamp_rally

  validates :status, presence: true
  enum :status, { uncompleted: 0, completed: 1 }
end
