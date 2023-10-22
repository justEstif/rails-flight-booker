class ChangeEmailColumnInPassengers < ActiveRecord::Migration[7.0]
  def change
    change_column(:passengers, :email, :string, null: false)
  end
end
