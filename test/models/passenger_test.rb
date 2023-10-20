require "test_helper"

class PassengerTest < ActiveSupport::TestCase
  test "passenger is valid when both email and name are present" do
    passenger = Passenger.new(name: "name", email: "test@test.com")
    assert passenger.valid?, "Passenger should be valid with all values present"
  end
  # test "passenger is invalid when name isn't present" do
  #   passenger = Passenger.new(email: 'test@test.com')
  #   assert_not passenger.valid?, 'Flight should not be valid with missing values'
  # end
  # test "passenger is invalid when email isn't present" do
  #   passenger = Passenger.new(name: 'test')
  #   assert_not passenger.valid?, 'Flight should not be valid with missing values'
  # end
  # requires name and email to be created
  # must be a unique email
  # stores name in proper case
  # stores email in lowercase
end
