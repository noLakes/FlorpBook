class CommentsController < ApplicationController

  def new 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save!
      redirect_to root_path
    else
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