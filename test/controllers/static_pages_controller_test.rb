require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:alan)
  end

  test "should get home" do
    log_in_as(@user)
    get root_path
    assert_response :success
  end
end
