class InquiryController < ApplicationController
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
      InquiryMailer.received_email(@inquiry).deliver
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end  
  end
end