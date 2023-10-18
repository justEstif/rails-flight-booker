# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Clear existing data
Airport.destroy_all
Flight.destroy_all
puts "deleted data"


# Create sample airports
airport1 = Airport.create(code: "JFK")
airport2 = Airport.create(code: "LAX")
airport3 = Airport.create(code: "ORD")

puts "created airports"

# Create sample flights
Flight.create(
  start_time: DateTime.current,
  end_time: DateTime.current + 6.hours,
  duration: 6.hours.to_i,
  arrival_airport_id: airport2.id,
  departure_airport_id: airport1.id,
)

puts "created flight"

# Flight.create(
#   start_time: DateTime.current + 1.day,
#   end_time: DateTime.current + 1.day + 5.hours,
#   duration: 5.hours.to_i,
#   arrival_airport_id: airport1.id,
#   departure_airport_id: airport3.id,
# )
#
# Flight.create(
#   start_time: DateTime.current + 2.days,
#   end_time: DateTime.current + 2.days + 4.hours,
#   duration: 4.hours.to_i,
#   arrival_airport_id: airport3.id,
#   departure_airport_id: airport2.id,
# )
#
# puts "Seed data created."
