class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
     @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.create_reset_digest
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
      if @user.saved_change_to_name? || @user.saved_change_to_password_digest?
        @user.send_user_edit
        flash[:success] = "プロフィールを更新しました"
      elsif @user.saved_change_to_email && current_user?(@user)
        UserMailer.account_activation(@user).deliver_now
        flash[:info] = "Please check your email to activate your account."
      elsif @user.saved_change_to_email && current_user.admin?
        @user.send_user_edit
        flash[:success] = "プロフィールを更新しました"
      end      
      redirect_to @user
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

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end  

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
