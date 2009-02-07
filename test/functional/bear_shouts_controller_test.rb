require 'test_helper'

class BearShoutsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bear_shouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bear_shout" do
    assert_difference('BearShout.count') do
      post :create, :bear_shout => { }
    end

    assert_redirected_to bear_shout_path(assigns(:bear_shout))
  end

  test "should show bear_shout" do
    get :show, :id => bear_shouts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bear_shouts(:one).id
    assert_response :success
  end

  test "should update bear_shout" do
    put :update, :id => bear_shouts(:one).id, :bear_shout => { }
    assert_redirected_to bear_shout_path(assigns(:bear_shout))
  end

  test "should destroy bear_shout" do
    assert_difference('BearShout.count', -1) do
      delete :destroy, :id => bear_shouts(:one).id
    end

    assert_redirected_to bear_shouts_path
  end
end
