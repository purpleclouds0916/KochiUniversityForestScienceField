require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:alan)
  end

  test "should get new" do
    log_in_as(@user)
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect show when not logged in" do
    get user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new when not logged in" do
    get new_user_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    post users_path, params: { user: { name: @user.name,
    email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end