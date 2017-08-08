class AddTriplogFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :triplog_confirmed, :boolean, default: false
    add_column :users, :triplog_email, :string
  end
end
