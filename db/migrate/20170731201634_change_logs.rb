class ChangeLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :strava_id, :integer
    add_column :logs, :name, :string
    remove_column :logs, :date, :date
    add_column :logs, :activity_date, :datetime
  end
end
