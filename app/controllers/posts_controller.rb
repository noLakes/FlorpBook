class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC").includes(:author, :comments)
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save!
      redirect_to root_path
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

  private

  def post_params
    params.require(:post).permit(:body, :image, :image_cache, :remove_image)
  end
end