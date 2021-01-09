require 'test_helper'

class AlumniMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get alumni_path
    assert_response :success
  end

end
