class CommentsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def new 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(comment_params[:post_id])

    if @comment.save!
      if @user != current_user
        @notification = new_notification(@post.author, @comment.id, 'comment')
        @notification.save
      end

      flash[:notice] = "Comment posted!"
      redirect_to root_path
    else
      flash[:notice] = "Failed to post comment"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end