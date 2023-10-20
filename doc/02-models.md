## Models

- Booking
  - number of tickets
  - flight id
  - passenger id
- Passenger
- Flights

### Passenger

- name
- email
- has_many bookings
- booked_flights through bookings

### Bookings

- belongs_to passenger
- belongs_to flight
- number of passengers: int
- a booking involves creating a passenger

### Flights

- has_many: bookings
- has-many passengers through bookings
