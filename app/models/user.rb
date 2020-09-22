class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts, class_name: "Post", foreign_key: "author_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
