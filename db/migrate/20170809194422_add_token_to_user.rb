class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dashboard_token, :string
    add_index :users, :dashboard_token, unique: true
  end
end
