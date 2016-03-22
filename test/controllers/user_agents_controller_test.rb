require 'test_helper'

class UserAgentsControllerTest < ActionController::TestCase
  setup do
    @user_agent = user_agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_agents)
  end

  test "should create user_agent" do
    assert_difference('UserAgent.count') do
      post :create, user_agent: { editor: @user_agent.editor, last_seen: @user_agent.last_seen, os: @user_agent.os, user_agent: @user_agent.user_agent, user_id: @user_agent.user_id, version: @user_agent.version }
    end

    assert_response 201
  end

  test "should show user_agent" do
    get :show, id: @user_agent
    assert_response :success
  end

  test "should update user_agent" do
    put :update, id: @user_agent, user_agent: { editor: @user_agent.editor, last_seen: @user_agent.last_seen, os: @user_agent.os, user_agent: @user_agent.user_agent, user_id: @user_agent.user_id, version: @user_agent.version }
    assert_response 204
  end

  test "should destroy user_agent" do
    assert_difference('UserAgent.count', -1) do
      delete :destroy, id: @user_agent
    end

    assert_response 204
  end
end
