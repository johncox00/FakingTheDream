require 'test_helper'

class LightEffectsControllerTest < ActionController::TestCase
  setup do
    @light_effect = light_effects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:light_effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create light_effect" do
    assert_difference('LightEffect.count') do
      post :create, light_effect: { meta: @light_effect.meta, name: @light_effect.name }
    end

    assert_redirected_to light_effect_path(assigns(:light_effect))
  end

  test "should show light_effect" do
    get :show, id: @light_effect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @light_effect
    assert_response :success
  end

  test "should update light_effect" do
    put :update, id: @light_effect, light_effect: { meta: @light_effect.meta, name: @light_effect.name }
    assert_redirected_to light_effect_path(assigns(:light_effect))
  end

  test "should destroy light_effect" do
    assert_difference('LightEffect.count', -1) do
      delete :destroy, id: @light_effect
    end

    assert_redirected_to light_effects_path
  end
end
