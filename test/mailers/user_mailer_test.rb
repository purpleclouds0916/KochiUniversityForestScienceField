require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  # def setup
  #   ActionMailer::Base.deliveries.clear
  # end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "パスワードのリセット | 高知大学森林科学領域", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["purpleclouds0916@gmail.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end
end
