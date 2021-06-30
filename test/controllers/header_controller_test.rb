require "test_helper"

class HeaderControllerTest < ActionDispatch::IntegrationTest
  test "should get header" do
    get header_header_url
    assert_response :success
  end
end
