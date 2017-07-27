class AddStuffToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :strava_id, :string
    add_column :users, :access_token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
  end
end
