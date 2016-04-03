require 'test_helper'

class LeadersControllerTest < ActionController::TestCase
  setup do
    @leader = leaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaders)
  end

  test "should create leader" do
    assert_difference('Leader.count') do
      post :create, leader: { rank: @leader.rank, user_id: @leader.user_id }
    end

    assert_response 201
  end

  test "should show leader" do
    get :show, id: @leader
    assert_response :success
  end

  test "should update leader" do
    put :update, id: @leader, leader: { rank: @leader.rank, user_id: @leader.user_id }
    assert_response 204
  end

  test "should destroy leader" do
    assert_difference('Leader.count', -1) do
      delete :destroy, id: @leader
    end

    assert_response 204
  end
end
