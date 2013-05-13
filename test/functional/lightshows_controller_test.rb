require 'test_helper'

class LightshowsControllerTest < ActionController::TestCase
  setup do
    @lightshow = lightshows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lightshows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lightshow" do
    assert_difference('Lightshow.count') do
      post :create, lightshow: {  }
    end

    assert_redirected_to lightshow_path(assigns(:lightshow))
  end

  test "should show lightshow" do
    get :show, id: @lightshow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lightshow
    assert_response :success
  end

  test "should update lightshow" do
    put :update, id: @lightshow, lightshow: {  }
    assert_redirected_to lightshow_path(assigns(:lightshow))
  end

  test "should destroy lightshow" do
    assert_difference('Lightshow.count', -1) do
      delete :destroy, id: @lightshow
    end

    assert_redirected_to lightshows_path
  end
end
