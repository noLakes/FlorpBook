class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts, class_name: "Post", foreign_key: "author_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :sent_requests, -> { where confirmed: false}, class_name: "FriendRequest",
  foreign_key: "user_id"

  has_many :pending_requests, -> { where confirmed: false}, class_name: "FriendRequest",
  foreign_key: "friend_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :avatar_size

  def friends
    friends_i_sent_inv = FriendRequest.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_received_inv = FriendRequest.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_inv + friends_i_received_inv
    User.where(id: ids)
  end

  def friend_with?(user)
    FriendRequest.confirmed_record?(id, user.id)
  end

  def send_request(user)
    sent_requests.create(friend_id: user.id)
  end

  def possible_friend?(user)
    !FriendRequest.reacted?(id, user.id)
  end

  private

  def avatar_size
    errors.add(:avatar, 'should be smaller than 1MB') if avatar.size > 1.megabytes
  end

end
