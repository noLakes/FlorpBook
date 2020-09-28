class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @notifications = Notification.all
  end

  def destroy 
    @notification = Notification.find(params[:notification_id])
    @notification.destroy
  end

end