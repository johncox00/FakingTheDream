require 'test_helper'

class TourDatesControllerTest < ActionController::TestCase
  setup do
    @tour_date = tour_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_date" do
    assert_difference('TourDate.count') do
      post :create, tour_date: { age_restrictions: @tour_date.age_restrictions, cover: @tour_date.cover, date_time: @tour_date.date_time, notes: @tour_date.notes }
    end

    assert_redirected_to tour_date_path(assigns(:tour_date))
  end

  test "should show tour_date" do
    get :show, id: @tour_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_date
    assert_response :success
  end

  test "should update tour_date" do
    put :update, id: @tour_date, tour_date: { age_restrictions: @tour_date.age_restrictions, cover: @tour_date.cover, date_time: @tour_date.date_time, notes: @tour_date.notes }
    assert_redirected_to tour_date_path(assigns(:tour_date))
  end

  test "should destroy tour_date" do
    assert_difference('TourDate.count', -1) do
      delete :destroy, id: @tour_date
    end

    assert_redirected_to tour_dates_path
  end
end
