class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts, class_name: "Post", foreign_key: "author_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
