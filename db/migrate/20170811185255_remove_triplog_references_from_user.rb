class RemoveTriplogReferencesFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :triplog_email, :string
    remove_column :users, :triplog_confirmed, :boolean
  end
end
