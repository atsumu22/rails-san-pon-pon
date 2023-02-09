class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops, dependent: :destroy
  has_many :stamp_rallies, dependent: :destroy #as a chairman
  has_many :stamp_rallies_as_participants , through: :participants, source: :stamp_rallies # as a participant --> source to specify where to look
end
