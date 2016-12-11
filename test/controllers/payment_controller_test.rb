require 'test_helper'

class PaymentControllerTest < ActionController::TestCase
  test "should get client_token" do
    get :client_token
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

end
