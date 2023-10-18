class Airport < ApplicationRecord
  before_validation :upcase_airport_code, on: [:create, :update]

  validates :code, presence: true, uniqueness: true

  private

  def upcase_airport_code
    return if code.nil? || !code.is_a?(String)
    self.code = code.upcase
  end
end
