require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should log in" do
    User.stubs(:authenticate).returns true
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
