require 'test_helper'

class AlumniMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get alumni_messages_message_url
    assert_response :success
  end

end
