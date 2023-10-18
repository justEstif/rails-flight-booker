class Airport < ApplicationRecord
  before_validation do |airport|
    if airport && airport.code.is_a?(String)
      airport.code = airport.code.upcase
    end
  end
  validates :code, presence: true, uniqueness: true
end
