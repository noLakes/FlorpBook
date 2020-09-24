module ApplicationHelper

  def new_notification(user, notice_id, type)
    notice = user.notification.build(notice_id: notice_id,
    type: type)
    return notice
  end

  def find_notification(notice, type)
    FriendRequest.find(notice.notice_id) if type == 'friend_request'
    Post.find(notice.notice_id) if type == 'comment'
    Comment.find() if type == 'like-comment'
    Post.find() if type == 'like-post'
  end

end
