require 'test_helper'

class StaticContentControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get denied" do
    get :denied
    assert_response :success
  end

end
