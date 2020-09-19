class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :post
      t.references :author

      t.timestamps
    end

    add_foreign_key :comments, :posts, column: :post_id
    add_foreign_key :comments, :users, column: :author_id
  end
end
