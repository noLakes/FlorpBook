module ApplicationHelper

  def new_notification(user, notice_id, type)
    notice = user.notification.build(notice_id: notice_id,
    type: type)
    return notice
  end
end
