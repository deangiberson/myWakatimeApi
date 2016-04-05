require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  setup do
    @stat = stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stats)
  end

  test "should create stat" do
    assert_difference('Stat.count') do
      post :create, stat: { daily_average: @stat.daily_average, end: @stat.end, holidays: @stat.holidays, is_already_updating: @stat.is_already_updating, is_stuck: @stat.is_stuck, is_up_to_date: @stat.is_up_to_date, range: @stat.range, start: @stat.start, status: @stat.status, timeout: @stat.timeout, timezone: @stat.timezone, total_seconds: @stat.total_seconds, user_id: @stat.user_id, writes_only: @stat.writes_only }
    end

    assert_response 201
  end

  test "should show stat" do
    get :show, id: @stat
    assert_response :success
  end

  test "should update stat" do
    put :update, id: @stat, stat: { daily_average: @stat.daily_average, end: @stat.end, holidays: @stat.holidays, is_already_updating: @stat.is_already_updating, is_stuck: @stat.is_stuck, is_up_to_date: @stat.is_up_to_date, range: @stat.range, start: @stat.start, status: @stat.status, timeout: @stat.timeout, timezone: @stat.timezone, total_seconds: @stat.total_seconds, user_id: @stat.user_id, writes_only: @stat.writes_only }
    assert_response 204
  end

  test "should destroy stat" do
    assert_difference('Stat.count', -1) do
      delete :destroy, id: @stat
    end

    assert_response 204
  end
end
