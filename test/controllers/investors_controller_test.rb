require 'test_helper'

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get investors_new_url
    assert_response :success
  end

end
