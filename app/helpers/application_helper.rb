module ApplicationHelper

  def new_notification(user, notice_id, type)
    notice = user.notification.build(notice_id: notice_id,
    type: type)
    return notice
  end

  #Returns object user is being notified about
  def find_notification(notice, type)
    r = nil
    r = FriendRequest.find(notice.notice_id) if type == 'friend_request'
    r = Comment.find(notice.notice_id) if type == 'comment'
    r = Comment.find() if type == 'like-comment'
    r = Post.find() if type == 'like-post'
    return r unless type == 'comment'
    Post.find(r.post_id)
  end

end
