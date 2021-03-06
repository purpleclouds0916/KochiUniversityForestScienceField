# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    user.create_reset_digest
    UserMailer.password_reset(user)
  end

  def create_user
    user = User.second
    # @text = "あなたは高知大学の管理者に追加されました"
    user.reset_token = User.new_token
    user.create_reset_digest
    UserMailer.create_user(user)
  end

  def edit_user
    user = User.second
    user.create_reset_digest
    UserMailer.edit_user(user)
  end
end
