class AddColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :sender_id, :integer, null: true
  end
end
