require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get :user" do
    get ::user
    assert_response :success
  end

  test "should get current" do
    get :current
    assert_response :success
  end

end
