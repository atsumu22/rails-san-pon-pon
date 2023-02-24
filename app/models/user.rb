class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shops, dependent: :destroy
  has_many :stamp_rallies, dependent: :destroy #as a chairman
  has_many :participants
  has_many :stamp_rallies_as_participants, through: :participants, source: :stamp_rallies # as a participant --> source to specify where to look
  has_one_attached :photo

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :status, presence: true #with radiobutton
  enum :status, { user: 0, chairperson: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
