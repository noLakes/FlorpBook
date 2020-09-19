class RemoveUserHandleDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :handle, from: "", to: nil
  end
end
