class Dog < ApplicationRecord
	belongs_to :user
	has_many :bookings, dependent: :destroy
	has_many :booked_users, through: :bookings, source: :user
	has_one_attached :photo

	validates :name, presence: true
	validates :breed, :description, presence: true

	include PgSearch::Model
  	pg_search_scope :search_by_name_and_breed,
    	against: [ :name, :breed ],
    	using: {
      		tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
