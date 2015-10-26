require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @family = Family.create(:name => 'happy')
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
