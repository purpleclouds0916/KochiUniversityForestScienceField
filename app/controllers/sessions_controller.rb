class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # redirect_back_or posts_path
      redirect_to posts_path
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違えています。' 
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def new_guest
    user = User.guest
    log_in user
    flash[:success] = "ゲストユーザーとしてログインしました"
    redirect_to posts_path
  end
end
