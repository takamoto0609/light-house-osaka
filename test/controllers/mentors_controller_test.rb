require 'test_helper'

class MentorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mentors_index_url
    assert_response :success
  end

end
