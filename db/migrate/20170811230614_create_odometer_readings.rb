class CreateOdometerReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :odometer_readings do |t|
      t.date :date
      t.integer :mileage
      t.string :notes
    end
  end
end
