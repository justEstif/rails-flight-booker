class RemoveIndexFromPassengers < ActiveRecord::Migration[7.0]
  def change
    remove_index :passengers, name: "index_passengers_on_email"
  end
end
