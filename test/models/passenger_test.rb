require "test_helper"

class PassengerTest < ActiveSupport::TestCase
  test "passenger is valid when both email and name are present" do
    passenger = Passenger.new(name: "name", email: "test@test.com")
    assert passenger.valid?, "Passenger should be valid with all values present"
  end
  test "passenger is invalid when name isn't present" do
    passenger = Passenger.new(email: "test@test.com")
    assert_not passenger.valid?, "passenger should both email and name"
  end
  test "passenger is invalid when email isn't present" do
    passenger = Passenger.new(name: "test")
    assert_not passenger.valid?, "passenger should both email and name"
  end
  # test "passenger requires unique email to be used" do
  #   Passenger.create(name: "name", email: "test@test.com")
  #   passenger = Passenger.new(name: "name", email: "test@test.com")
  #   assert_not passenger.valid?, "passenger should have a unique email"
  # end
  test "stores passenger email in lowercase" do
    passenger = Passenger.create(name: "name", email: "TEST@TEST.COM")
    assert_equal "test@test.com", passenger.email, "passenger email should be saved in lowercase"
  end
  test "stores passenger name in titlecase" do
    passenger = Passenger.create(name: "john doe", email: "TEST@TEST.COM")
    assert_equal "John Doe", passenger.name, "passenger name should be saved in titlecase"
  end
end
