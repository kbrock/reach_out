require 'test_helper'

class GizmosControllerTest < ActionController::TestCase
  setup do
    f = Family.create(:name => 'default')
    @gizmo = Gizmo.create(:name => 'reid', :color => '0000ff', :status => true, :family => f)
  end

  test "should get families index" do
    get :index
    assert_redirected_to families_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gizmo" do
    assert_difference('Gizmo.count') do
      post :create, params: { gizmo: { color: @gizmo.color, name: @gizmo.name, status: @gizmo.status } }
    end

    assert_redirected_to gizmo_path(Gizmo.last)
  end

  test "should show gizmo" do
    get :show, params: { id: @gizmo }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @gizmo }
    assert_response :success
  end

  test "should update gizmo" do
    patch :update, params: { id: @gizmo, gizmo: { color: @gizmo.color, name: @gizmo.name, status: @gizmo.status } }
    assert_redirected_to gizmo_path(@gizmo)
  end

  test "should destroy gizmo" do
    assert_difference('Gizmo.count', -1) do
      delete :destroy, params: { id: @gizmo }
    end

    assert_redirected_to gizmos_path
  end
end
