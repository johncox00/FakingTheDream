require 'test_helper'

class LightShowSegmentsControllerTest < ActionController::TestCase
  setup do
    @light_show_segment = light_show_segments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:light_show_segments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create light_show_segment" do
    assert_difference('LightShowSegment.count') do
      post :create, light_show_segment: { color_hex: @light_show_segment.color_hex, duration: @light_show_segment.duration, effect: @light_show_segment.effect, sort_order: @light_show_segment.sort_order, strobe_duration: @light_show_segment.strobe_duration, text: @light_show_segment.text }
    end

    assert_redirected_to light_show_segment_path(assigns(:light_show_segment))
  end

  test "should show light_show_segment" do
    get :show, id: @light_show_segment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @light_show_segment
    assert_response :success
  end

  test "should update light_show_segment" do
    put :update, id: @light_show_segment, light_show_segment: { color_hex: @light_show_segment.color_hex, duration: @light_show_segment.duration, effect: @light_show_segment.effect, sort_order: @light_show_segment.sort_order, strobe_duration: @light_show_segment.strobe_duration, text: @light_show_segment.text }
    assert_redirected_to light_show_segment_path(assigns(:light_show_segment))
  end

  test "should destroy light_show_segment" do
    assert_difference('LightShowSegment.count', -1) do
      delete :destroy, id: @light_show_segment
    end

    assert_redirected_to light_show_segments_path
  end
end
