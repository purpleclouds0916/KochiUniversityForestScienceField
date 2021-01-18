class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :new, :create]

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
    @user.update!(user_params)
    if @user.update(user_params)
       #名前またはパスワードが変更された時
      if @user.saved_change_to_name || @user.saved_change_to_password_digest
      flash[:success] = "一番上の分岐　プロフィールを更新しました"
      end  
      #自分自身でメールアドレスが変更された時
      if @user.saved_change_to_new_email && current_user?(@user)
        # UserMailer.account_activation(@user).deliver_now
        @user.create_reset_digest
        @user.send_email_activation_email
        flash[:success] = "2番目の分岐です。確認メールを送信しました。承認されるまで、新しいメールアドレスは有効かされません。"
      #管理者により他のユーザーのメールアドレスが変更された時  
      elsif @user.saved_change_to_new_email && current_user.admin?
        @user.send_user_edit
        flash[:success] = "最後の分岐です"
      end      
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
                                   :password_confirmation,:new_email)
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
