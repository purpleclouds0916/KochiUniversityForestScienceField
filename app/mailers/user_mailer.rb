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
end
