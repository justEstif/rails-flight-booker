class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :bookings
  has_many :flights, through: :bookings
end
