class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, class_name: "Comment", foreign_key: "post_id"
  has_many :likes, dependent: :destroy

  def like_count
    likes = self.likes.count
    likes > 0 ? likes : nil
  end

end
