class AddNotesToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :notes, :text
  end
end
