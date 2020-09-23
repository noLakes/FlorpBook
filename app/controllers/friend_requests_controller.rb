class FriendRequestsController < ApplicationController

  def create
    friend = User.find(params[:user_id])
    current_user.send_request(friend)
    flash[:notice] = "Friend Request sent to #{friend.name}"
    redirect_back(fallback_location: root_path)
  end

end