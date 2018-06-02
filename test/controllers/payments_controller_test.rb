require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get check_out" do
    get payments_check_out_url
    assert_response :success
  end

end
