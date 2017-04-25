require 'test_helper'

class FacebookShareOptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get share_link" do
    get :share_link
    assert_response :success
  end

end
