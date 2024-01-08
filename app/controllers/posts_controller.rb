class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.post.create(post_params)
    flash[:notice] = "Статья была создана"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def authenticate_user
    redirect_to new_user_session_path if current_user.nil?
  end

  def set_post
    @post = Post.find(params[:id])
  end

end