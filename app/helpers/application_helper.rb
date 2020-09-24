module ApplicationHelper

  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id: notice_id,
    notice_type: notice_type)
    return notice
  end

  #Returns object user is being notified about
  def find_notification(notice, notice_type)
    r = nil
    r = FriendRequest.find(notice.notice_id) if notice_type == 'friend_request'
    r = Comment.find(notice.notice_id) if notice_type == 'comment'
    r = Comment.find(notice.notice_id) if notice_type == 'like-comment'
    r = Post.find(notice.notice_id) if notice_type == 'like-post'
    return r unless notice_type == 'comment'
    Post.find(r.post_id)
  end

end
