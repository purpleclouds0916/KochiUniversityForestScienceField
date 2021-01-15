class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #

  def password_reset(user)
    @greeting = "こんにちは"
    @user = user
    mail to: user.email, subject: "パスワードのリセット | 高知大学森林科学領域"
  end

  def create_user(user)
    @greeting = "こんにちは"
    @user = user
    # @text = @text
    mail to: user.email, subject: "管理者の作成 | 高知大学森林科学領域"
  end

  # メールアドレスの更新以外の変更連絡（自分で変更した場合）
  def edit_user(user)
    @greeting = "こんにちは"
    @user = user
    @automatic_mail = "これは自動メールです" 
    mail to: user.email, subject: "ユーザー情報が更新されました | 高知大学森林科学領域"
  end
end
