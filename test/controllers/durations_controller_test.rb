require 'test_helper'

class DurationsControllerTest < ActionController::TestCase
  setup do
    @duration = durations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:durations)
  end

  test "should create duration" do
    assert_difference('Duration.count') do
      post :create, duration: { branch: @duration.branch, duration: @duration.duration, project: @duration.project, time: @duration.time, user_id: @duration.user_id }
    end

    assert_response 201
  end

  test "should show duration" do
    get :show, id: @duration
    assert_response :success
  end

  test "should update duration" do
    put :update, id: @duration, duration: { branch: @duration.branch, duration: @duration.duration, project: @duration.project, time: @duration.time, user_id: @duration.user_id }
    assert_response 204
  end

  test "should destroy duration" do
    assert_difference('Duration.count', -1) do
      delete :destroy, id: @duration
    end

    assert_response 204
  end
end
