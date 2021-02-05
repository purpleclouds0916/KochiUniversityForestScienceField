class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
     @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts.where(user_id: @user.id) : @user.posts
    @posts = posts.page(params[:page]).per(10)
    @test = users_path
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.create_reset_digest
      # ユーザー作成時専用のパスワードリセットメールの送信
      @user.send_password_reset_email_create
      flash[:success] = "新しい管理者を作成しました。新しい管理者にメールが送信されました。"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.send_user_edit
      flash[:success] = "プロフィールを更新しました!"
      #自分自身でメールアドレスを変更した時
      # if @user.saved_change_to_email && current_user?(@user)
      #  UserMailer.account_activation(@user).deliver_now
      # flash[:info] = "メールを確認して、メールアドレスを有効化してください。"
      # end
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
