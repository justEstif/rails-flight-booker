class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code, null: false, unique: true

      t.timestamps
    end
  end
end
