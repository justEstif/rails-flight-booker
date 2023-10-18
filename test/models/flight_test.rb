require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test "flight can only be created when all the values are present" do
    start_time = DateTime.current
    end_time = start_time + 1.day
    duration = (end_time - start_time).to_i
    flight = Flight.new(start_time:, end_time:, duration:,
                        arrival_airport_id: 1, departure_airport_id: 2)
    assert flight.valid?, "Flight should be valid with all values present"
  end

  test "flight duration is added automatically using callbacks" do
    start_time = DateTime.current
    end_time = start_time + 1.day
    flight = Flight.new(start_time: start_time, end_time: end_time, arrival_airport_id: 1, departure_airport_id: 2)
    assert flight.valid?, "Flight is valid without passing in duration"
    flight.save
    assert_equal 86400, flight.duration, "Flight duration should be 86400 seconds (1 day)"
  end

  test "flight start_time must be before end time" do
    start_time = DateTime.current
    end_time = start_time - 1.day # Set end_time to be before start_time

    flight = Flight.new(start_time:, end_time:, arrival_airport_id: 1, departure_airport_id: 2)

    assert_not flight.valid?, "Flight with end time before start time should not be valid"
    assert_includes flight.errors[:end_time], "must be after the start time"
  end

  test "arrival and departure airports must be different" do
    start_time = DateTime.current
    end_time = start_time + 1.day
    flight = Flight.new(start_time:, end_time:, arrival_airport_id: 1, departure_airport_id: 1)

    assert_not flight.valid?, "Flight with the same arrival and departure airport should not be valid"
    assert_includes flight.errors[:departure_airport], "must not be the same as the arrival airport"
  end
end
