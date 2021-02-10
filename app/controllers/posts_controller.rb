class PostsController < ApplicationController  
  before_action :logged_in_user
  #↓本来のaction*すでに公開しているので、全てにおいてログイン制限。
  # before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post
    @posts = @posts.page(params[:page]).per(10)
  end

  #機能はするが修正が必要あとでリダイレクト先を変更
  def show
    if Post.find_by(id:params[:id]).present?
      post = Post.find_by(id:params[:id])
      post_tag_name = post.tag.name
        #卒業生の声の記事なら表示する
      if post_tag_name = "卒業生の声"
        @post = post 
        @posts = Tag.find(6).posts.limit(4)
        #それ以外のタグ記事は404扱い     
      else
        redirect_to root_url 
      end
    #存在しないページは404扱い
    else
      redirect_to root_url 
    end  
  end

  def new
    @tag = Tag.find(params[:tag_id]) if params[:tag_id].present? 
    if logged_in?
      @post = current_user.posts.build
      if @tag.present?
        if @tag.name == "森林科学領域" || @tag.name == "授業の紹介" || @tag.name == "先生の紹介動画"
          @post.url.build
        elsif @tag.name == "先生の紹介"
          @post.build_teacher
        elsif @tag.name == "資格"
          @post.build_skill
        elsif @tag.name == "卒業生の声"  
          @post.build_alumni
        end 
      end  
    end
  end

  def create    
    @post = current_user.posts.build(post_params)
    @tag = Tag.find(@post.tag_id)
    if @post.images.present?
      resize_image_by_tag()
      @post.images.attach(params[:post][:images])
    end

    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit    
    @post = Post.find(params[:id])
    @tag = Tag.find(@post.tag_id)
  end

  def update
    @post = Post.find_by(id: params[:id])
    @tag = Tag.find(@post.tag_id)

    if @post.images.present?
      resize_image_by_tag()
      @post.images.attach(params[:post][:images])
    end
    
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
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:id, :content, :title, :lead, :tag_id, images: [], 
      alumni_attributes: [:id, :name, :birthplace, :job, :research_field, :research_office, :reason, :learning, :job_description, :memories, :original_title, :original_content],
      teacher_attributes: [:id, :name, :job, :post_id],
      skill_attributes: [:id, :name],
      url_attributes: [:id, :name, :external_url, :teacher_hp_url, :movie_url, :_destroy])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def resize_image(width = 1280,height = 1280) 
    post_params[:images].each do |image|
        image.tempfile = ImageProcessing::MiniMagick.source(image.tempfile).resize_to_fit(width, height).call
    end
  end   

  def resize_image_by_tag
    if @tag.name == "スライダー"
      resize_image(1200,1200) 
    elsif @tag.name == "森林を学ぶ価値" || @tag.name == "資格" || @tag.name == "先生の紹介" 
      resize_image(150,150) 
    elsif @tag.name == "森林科学領域" || @tag.name == "授業の紹介" || @tag.name == "卒業生の声" 
      resize_image(800,800)
    else
      resize_image()
    end    
  end
end
