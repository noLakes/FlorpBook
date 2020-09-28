class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def create
    friend = User.find(params[:user_id])
    current_user.send_request(friend)
    
    @request = current_user.sent_requests.last
    @notificaiton = new_notification(friend, @request.id, 'friend_request')
    @notificaiton.save

    flash[:notice] = "Friend Request sent to #{friend.name}"
    redirect_back(fallback_location: root_path)
  end

  def accept
    @request = FriendRequest.find(params[:request_id])
    @friend = User.find(@request.user_id)
    @request.confirmed = true
    
    if @request.save!
      flash[:notice] = "#{@friend.name} is now your friend!"
    else
      flash[:notice] = "error adding friend"
    end
    redirect_back(fallback_location: root_path)
  end

  def decline
    @request = FriendRequest.find(params[:request_id])
    @request.destroy

    redirect_back(fallback_location: root_path)
  end

end