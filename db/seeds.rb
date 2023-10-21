# Clear existing data
Booking.destroy_all
Airport.destroy_all
Flight.destroy_all
Passenger.destroy_all

# Create 10 sample airports
airport_codes = ["JFK", "LAX", "ORD", "ATL", "DFW", "SFO", "MIA", "DEN", "PHX", "LAS"]
airports = airport_codes.map { |code| Airport.create(code: code) }

# Create 100 sample flights
100.times do
  departure_airport = airports.sample
  arrival_airport = (airports - [departure_airport]).sample

  Flight.create(
    start_time: DateTime.current + rand(365).days,
    end_time: DateTime.current + rand(365).days + rand(24).hours,
    duration: rand(24).hours.to_i,
    arrival_airport: arrival_airport,
    departure_airport: departure_airport
  )
end

# Create sample passengers
10.times do |i|
  Passenger.create(
    name: "Passenger #{i + 1}",
    email: "passenger#{i + 1}@example.com"
  )
end

# Create sample bookings
50.times do
  passenger = Passenger.all.sample
  flight = Flight.all.sample
  number_of_tickets = rand(1..5) # Random number of tickets between 1 and 5

  Booking.create(
    passenger: passenger,
    flight: flight,
    number_of_tickets: number_of_tickets
  )
end

