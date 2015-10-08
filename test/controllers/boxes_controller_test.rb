require 'test_helper'

class BoxesControllerTest < ActionController::TestCase
  setup do
    @box = boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create box" do
    assert_difference('Box.count') do
      post :create, box: { arr_address: @box.arr_address, arr_lat: @box.arr_lat, arr_long: @box.arr_long, departure_address: @box.departure_address, departure_lat: @box.departure_lat, departure_long: @box.departure_long, description: @box.description, expiration: @box.expiration, image: @box.image, user_id: @box.user_id, weight: @box.weight }
    end

    assert_redirected_to box_path(assigns(:box))
  end

  test "should show box" do
    get :show, id: @box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @box
    assert_response :success
  end

  test "should update box" do
    patch :update, id: @box, box: { arr_address: @box.arr_address, arr_lat: @box.arr_lat, arr_long: @box.arr_long, departure_address: @box.departure_address, departure_lat: @box.departure_lat, departure_long: @box.departure_long, description: @box.description, expiration: @box.expiration, image: @box.image, user_id: @box.user_id, weight: @box.weight }
    assert_redirected_to box_path(assigns(:box))
  end

  test "should destroy box" do
    assert_difference('Box.count', -1) do
      delete :destroy, id: @box
    end

    assert_redirected_to boxes_path
  end
end
