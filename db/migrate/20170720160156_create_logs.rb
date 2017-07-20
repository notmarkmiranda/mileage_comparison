class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.decimal :distance
      t.date :date
      t.integer :travel_type
      t.timestamps null: false
    end
  end
end
