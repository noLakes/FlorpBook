class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts, class_name: "Post", foreign_key: "author_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, dependent: :destroy

  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "user_id"
  has_many :pending_friend_requests, -> { where confirmed: false}, class_name: "FriendRequest",
  foreign_key: "friend_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
