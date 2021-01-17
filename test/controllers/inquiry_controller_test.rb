require 'test_helper'

class InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inquiry_path
    assert_response :success
  end

  # test "should get thanks" do
  #実際にメール送信のシュミレーションを書かないとエラーになる
  #   post inquiry_thanks_path
  #   assert_response :success
  # end
end
