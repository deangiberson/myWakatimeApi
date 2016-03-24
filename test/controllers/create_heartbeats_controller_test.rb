require 'test_helper'

class CreateHeartbeatsControllerTest < ActionController::TestCase
  setup do
    @create_heartbeat = create_heartbeats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_heartbeats)
  end

  test "should create create_heartbeat" do
    assert_difference('CreateHeartbeat.count') do
      post :create, create_heartbeat: { branch: @create_heartbeat.branch, cursorpos: @create_heartbeat.cursorpos, dependencies: @create_heartbeat.dependencies, entity: @create_heartbeat.entity, is_debugging: @create_heartbeat.is_debugging, is_write: @create_heartbeat.is_write, language: @create_heartbeat.language, lineno: @create_heartbeat.lineno, lines: @create_heartbeat.lines, project: @create_heartbeat.project, time: @create_heartbeat.time, type: @create_heartbeat.type, user_id: @create_heartbeat.user_id }
    end

    assert_response 201
  end

  test "should show create_heartbeat" do
    get :show, id: @create_heartbeat
    assert_response :success
  end

  test "should update create_heartbeat" do
    put :update, id: @create_heartbeat, create_heartbeat: { branch: @create_heartbeat.branch, cursorpos: @create_heartbeat.cursorpos, dependencies: @create_heartbeat.dependencies, entity: @create_heartbeat.entity, is_debugging: @create_heartbeat.is_debugging, is_write: @create_heartbeat.is_write, language: @create_heartbeat.language, lineno: @create_heartbeat.lineno, lines: @create_heartbeat.lines, project: @create_heartbeat.project, time: @create_heartbeat.time, type: @create_heartbeat.type, user_id: @create_heartbeat.user_id }
    assert_response 204
  end

  test "should destroy create_heartbeat" do
    assert_difference('CreateHeartbeat.count', -1) do
      delete :destroy, id: @create_heartbeat
    end

    assert_response 204
  end
end
