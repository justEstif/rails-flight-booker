class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :duration, null: false # duration in seconds

      t.references :arrival_airport, null: false, foreign_key: { to_table: "airports" }
      t.references :departure_airport, null: false, foreign_key: { to_table: "airports" }

      t.timestamps
    end
  end
end
