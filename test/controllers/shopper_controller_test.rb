require 'test_helper'

class ShopperControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get shopper_home_url
    assert_response :success
  end

end
