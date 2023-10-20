class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer "number_of_tickets", default: 1
      t.belongs_to :passengers, null: false, foreign_key: true
      t.belongs_to :flights, null: false, foreign_key: true
      t.timestamps
    end
  end
end
