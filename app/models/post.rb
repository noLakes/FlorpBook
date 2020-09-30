class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: "User"
  has_many :comments, class_name: "Comment", foreign_key: "post_id"
  has_many :likes, dependent: :destroy

  validate :image_size

  def like_count
    self.likes.count
  end

  private

  def image_size
    errors.add(:image, 'should be smaller than 1MB') if image.size > 1.megabytes
  end

end
