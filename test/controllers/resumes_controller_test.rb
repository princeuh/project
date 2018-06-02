require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  test "should get status" do
    get resumes_status_url
    assert_response :success
  end

end
