require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get viewCart" do
    get :viewCart
    assert_response :success
  end

  test "should get generateCart" do
    get :generateCart
    assert_response :success
  end

end
