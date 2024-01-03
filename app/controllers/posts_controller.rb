class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.post.create(post_params)
    flash[:notice] = "Статья была создана"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authenticate_user
    redirect_to new_user_session_path if current_user.nil?
  end

end