class PostsController < ApplicationController
  
  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update!
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end