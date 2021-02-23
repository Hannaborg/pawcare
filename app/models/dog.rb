class Dog < ApplicationRecord
	belongs_to :user
	has_many :bookings, dependent: :destroy
	has_many :booked_users, through: :bookings, source: :user

	validates :name, presence: true
	validates :breed, :description, presence: true
end
