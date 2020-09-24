class ChangeTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :type, :notice_type
  end
end
