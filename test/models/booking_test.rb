require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "booking model requires both passenger and flight" do
    passenger = passengers(:one)
    flight = flights(:one)
    booking = Booking.new(flight:, passenger:, number_of_tickets: 1)
    assert booking.valid?, "booking is valid when both values are passed"
  end
  test "booking model doesn't work without flight" do
    passenger = passengers(:one)
    booking = Booking.new(passenger:, number_of_tickets: 1)
    assert_not booking.valid?, "booking requires both passenger and flight to be valid"
  end
  test "booking model doesn't work without passenger" do
    flight = flights(:one)
    booking = Booking.new(flight:, number_of_tickets: 1)
    assert_not booking.valid?, "booking requires both passenger and flight to be valid"
  end
  test "booking model defaults to 1 for number of passengers" do
    booking = Booking.create(flight: flights(:one), passenger: passengers(:one))

    assert booking.valid?, "booking should be valid"
    assert_equal 1, booking.number_of_tickets, "booking number_of_tickets defaults to 1"
  end
end
