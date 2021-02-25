class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :dog, :user, presence: true
end
