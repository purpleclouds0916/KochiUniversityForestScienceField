require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @admin     = users(:michael)
    @non_admin = users(:alan)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
    assert_select 'div.alert', "フォームに4個のエラーがあります"
  end

  test "successfully edited myself by non_admin" do
    log_in_as(@non_admin)
    get edit_user_path(@non_admin)
    assert_template 'users/edit'
    name  = "test"
    email = "test@test.com"
    patch user_path(@non_admin), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @non_admin
    @non_admin.reload
    assert_equal name,  @non_admin.name
    assert_equal email, @non_admin.email
  end

  test "successful editing of others by admin" do
    log_in_as(@admin)
    get edit_user_path(@admin)
    assert_template 'users/edit'
    name  = "test"
    email = "test@test.com"
    patch user_path(@admin), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @admin
    @admin.reload
    assert_equal name,  @admin.name
    assert_equal email, @admin.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end

