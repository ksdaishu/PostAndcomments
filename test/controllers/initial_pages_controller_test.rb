require 'test_helper'

class InitialPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get initial_pages_home_url
    assert_response :success
  end

end
