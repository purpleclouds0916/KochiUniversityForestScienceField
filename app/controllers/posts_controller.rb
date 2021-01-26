class PostsController < ApplicationController  
  before_action :logged_in_user
  #　↓本来のaction　*すでに公開しているので、全てにおいてログイン制限。　
  # before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post
    @posts = @posts.page(params[:page]).per(10)
  end

  #機能はするが修正が必要,2回もDBにアクセスしている&あとでリダイレクト先を変更
  def show
    if Post.find_by(id:params[:id]).present?
      post_id = Post.find_by(id:params[:id])
      post_tag = post_id.tags.all.ids
        #卒業生の声の記事なら表示する
      if post_tag.include?(6)
        @post = post_id 
        @posts = Tag.find(6).posts.limit(4)
        #それ以外の記事は404扱い     
      else
        redirect_to root_url 
      end
    #存在しないページは404扱い
    else
      redirect_to root_url 
    end  
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
    params.require(:post).permit(:content, :title, :name, :birthplace, :job, :research_field, :research_office, :reason, :learning, :job_description, :memories, :original_title, :original_content, :video_url , :external_url, :teacher_url, :url_references,:tag_ids, images: [])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
