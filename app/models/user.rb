class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs, dependent: :destroy
  has_many :bookings
  has_many :booked_dogs, through: :bookings, source: :dog

  validates :email, uniqueness: true, presence: true
end
