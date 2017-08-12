class AddUserToOdometerReadings < ActiveRecord::Migration[5.1]
  def change
    add_reference :odometer_readings, :user, foreign_key: true
  end
end
