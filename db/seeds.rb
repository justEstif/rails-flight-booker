# Clear existing data
Airport.destroy_all
Flight.destroy_all

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
    arrival_airport_id: arrival_airport.id,
    departure_airport_id: departure_airport.id,
  )
end
