class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false
      t.boolean :confirmed, default: false

      t.timestamps
    end

    add_foreign_key :friend_requests, :users, column: :friend_id
  end
end
