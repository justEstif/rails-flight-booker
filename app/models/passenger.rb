class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :bookings
  has_many :flights, through: :bookings

  before_validation :lowercase_email, on: %i[create update]
  before_validation :titlecase_name, on: %i[create update]

  private

  def titlecase_name
    return if name.nil? || !name.is_a?(String)

    self.name = name.titlecase
  end

  def lowercase_email
    return if email.nil? || !email.is_a?(String)

    self.email = email.downcase
  end
end
