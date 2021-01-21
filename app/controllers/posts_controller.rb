class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
  end

  def new
    @post = current_user.posts.build
    # @post = current_user.posts.build if logged_in?
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
