class Dog < ApplicationRecord
	# has_many :objects, class_name: "object", foreign_key: "reference_id"
	belongs_to :user
	has_many :bookings
  has_many :booked_users, through: :bookings, source: :user
end
