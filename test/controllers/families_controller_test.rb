require 'test_helper'

class FamiliesControllerTest < ActionController::TestCase
  setup do
    @family = families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family" do
    assert_difference('Family.count') do
      post :create, params: { family: { name: @family.name } }
    end

    assert_redirected_to family_path(Family.last)
  end

  test "should show family" do
    get :show, params: { id: @family }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @family }
    assert_response :success
  end

  test "should update family" do
    patch :update, params: { id: @family, family: { name: @family.name } }
    assert_redirected_to family_path(@family)
  end

  test "should destroy family" do
    assert_difference('Family.count', -1) do
      delete :destroy, params: { id: @family }
    end

    assert_redirected_to families_path
  end
end
