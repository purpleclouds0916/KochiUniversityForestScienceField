# require 'test_helper'

# class UsersIndexTest < ActionDispatch::IntegrationTest

#   def setup
#     @user = users(:michael)
#   end

#   test "index including pagination" do
#     @users = User.all.page(params[:page])
#     log_in_as(@user)
#     get users_path
#     assert_template 'users/index'
#     assert_select 'div.pagination'
#     @users.each do |user|
#       assert_select 'a[href=?]', edit_user_path(user), text: user.name
#     end
#   end
# end

