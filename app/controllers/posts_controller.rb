class PostsController < ApplicationController
  before_action :logged_in_user

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
      flash[:success] = "投稿を作成しました"
      redirect_to current_user
    else
      # @feed_items = current_user.feed.paginate(page: params[:page])
    render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to posts_path
    else
      render 'edit'
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
