require 'test_helper'

class HeartbeatsControllerTest < ActionController::TestCase
  setup do
    @heartbeat = heartbeats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heartbeats)
  end

  test "should create heartbeat" do
    assert_difference('Heartbeat.count') do
      post :create, heartbeat: { branch: @heartbeat.branch, cursorpos: @heartbeat.cursorpos, dependencies: @heartbeat.dependencies, entity: @heartbeat.entity, is_debugging: @heartbeat.is_debugging, is_write: @heartbeat.is_write, language: @heartbeat.language, lineno: @heartbeat.lineno, lines: @heartbeat.lines, project: @heartbeat.project, time: @heartbeat.time, type: @heartbeat.type, user_id: @heartbeat.user_id }
    end

    assert_response 201
  end

  test "should show heartbeat" do
    get :show, id: @heartbeat
    assert_response :success
  end

  test "should update heartbeat" do
    put :update, id: @heartbeat, heartbeat: { branch: @heartbeat.branch, cursorpos: @heartbeat.cursorpos, dependencies: @heartbeat.dependencies, entity: @heartbeat.entity, is_debugging: @heartbeat.is_debugging, is_write: @heartbeat.is_write, language: @heartbeat.language, lineno: @heartbeat.lineno, lines: @heartbeat.lines, project: @heartbeat.project, time: @heartbeat.time, type: @heartbeat.type, user_id: @heartbeat.user_id }
    assert_response 204
  end

  test "should destroy heartbeat" do
    assert_difference('Heartbeat.count', -1) do
      delete :destroy, id: @heartbeat
    end

    assert_response 204
  end
end
