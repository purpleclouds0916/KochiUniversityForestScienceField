class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    if logged_in?
      @post = current_user.posts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end  
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.images.attach(params[:post][:images])
    if @post.save
      flash[:success] = "post created!"
      redirect_to current_user
    else
      # @feed_items = current_user.feed.paginate(page: params[:page])
    render :action => 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user
    @post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to user_path(@user)
  end


  private

  def post_params
    params.require(:post).permit(:content, :title, :images)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
