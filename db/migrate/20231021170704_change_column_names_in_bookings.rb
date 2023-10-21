class ChangeColumnNamesInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :flights_id, :flight_id
    rename_column :bookings, :passengers_id, :passenger_id
  end
end
