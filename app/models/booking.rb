class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :dog, uniqueness: { scope: :user }
  validates :dog, :user, presence: true
end
