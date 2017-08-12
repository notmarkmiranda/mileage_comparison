class AddOdometerReadingsToLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :logs, :odometer_reading, foreign_key: true
  end
end
