class Airport < ApplicationRecord
  before_validation :upcase_airport_code, on: [:create, :update]

  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id", dependent: :destroy
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id", dependent: :destroy

  validates :code, presence: true, uniqueness: true

  private

  def upcase_airport_code
    return if code.nil? || !code.is_a?(String)
    self.code = code.upcase
  end
end
