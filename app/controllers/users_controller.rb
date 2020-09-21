class UsersController < ApplicationController
  before_action :authenitcate_user!

  def show
    @user = User.find(params[:id])
  end

end