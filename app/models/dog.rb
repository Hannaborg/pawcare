class Dog < ApplicationRecord
	belongs_to :user
	has_many :bookings
	has_many :booked_users, through: :bookings, source: :user

	validates :name, uniqueness: true, presence: true
	validates :breed, :description, presence: true
end
