class DropLoginFromUesr < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :login, :string
  end
end
