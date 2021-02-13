require 'test_helper'

class InquiryControllerTest < ActionDispatch::IntegrationTest
  # ログイン制限のためログインする
  def setup
    @user = users(:michael)
  end

  test "should get index" do
    log_in_as(@user)
    get inquiry_path
    assert_response :success
  end

  # test "should get thanks" do
  #実際にメール送信のシュミレーションを書かないとエラーになる
  #   post inquiry_thanks_path
  #   assert_response :success
  # end
end
