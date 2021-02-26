class Dog < ApplicationRecord
	belongs_to :user
	has_many :bookings, dependent: :destroy
	has_many :booked_users, through: :bookings, source: :user
	has_one_attached :photo

	validates :name, :age, :address, presence: true
	validates :breed, :description, presence: true

	include PgSearch::Model
  	pg_search_scope :search_by_name_and_breed_and_address,
    	against: [ :name, :breed, :address ],
    	using: {
      		tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

	geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

end
