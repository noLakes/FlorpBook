class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all
    @friends = current_user.friends
    @pending_requests = current_user.pending_requests
    @sent_requests = current_user.sent_requests
  end

end