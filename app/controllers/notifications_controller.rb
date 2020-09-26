class NotificationsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def index
    @notifications = current_user.notifications
  end
  
end