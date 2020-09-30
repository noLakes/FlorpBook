class AddImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :string, null: true
  end
end
