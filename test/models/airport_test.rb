require "test_helper"

class AirportTest < ActiveSupport::TestCase
  test "airport rows can't be created with null values" do
    airport = Airport.new
    assert_not airport.valid?, "Airport without code shouldn't be valid"
  end
  test "airport row can't be created without code present" do
    airport = Airport.new(code: "")
    assert_not airport.valid?, "Airport without code should not be valid"
    assert_includes airport.errors[:code], "can't be blank", "Validation error for code presence missing"
  end
  test "airport code must be unique" do
    Airport.create(code: "NYC")
    airport = Airport.new(code: "NYC")

    assert_not airport.valid?, "Airport with a non-unique code should not be valid"
    assert_includes airport.errors[:code], "has already been taken", "Validation error for code uniqueness missing"
  end
  test "airport code must be unique and case insensitive" do
    Airport.create(code: "NYC")
    airport = Airport.new(code: "nyc")

    assert_not airport.valid?, "Airport with a non-unique code should not be valid"
    assert_includes airport.errors[:code], "has already been taken", "Validation error for code uniqueness missing"
  end
end
