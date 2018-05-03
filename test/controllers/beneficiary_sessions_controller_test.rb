require 'test_helper'

class BeneficiarySessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beneficiary_sessions_new_url
    assert_response :success
  end

end
