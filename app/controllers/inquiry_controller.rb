class InquiryController < ApplicationController
    #すでに公開しているので、ログイン制限。実際は削除↓
    before_action :logged_in_user
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    # render :action => 'index'
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :kinds, :email, :message))  
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'thanks'
      @inquiry.receive_contact
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end  
  end
end