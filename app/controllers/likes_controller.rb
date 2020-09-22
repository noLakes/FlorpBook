class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    type = type_subject?(params)[0]
  end

  private

  def type_subject?(params)
    type = 'post' if params.key?('post_id')
    type = 'comment' if params.key?('comment_id')
    subject = Post.find(params[:post_id]) if type == 'post'
    subject = Comment.find(params[:comment_id]) if type == 'comment'
    [type, subject]
  end

end