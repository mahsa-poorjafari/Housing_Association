require 'test_helper'

class PayLimitsControllerTest < ActionController::TestCase
  setup do
    @pay_limit = pay_limits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_limits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_limit" do
    assert_difference('PayLimit.count') do
      post :create, pay_limit: { amount: @pay_limit.amount, project_id: @pay_limit.project_id, user_id: @pay_limit.user_id }
    end

    assert_redirected_to pay_limit_path(assigns(:pay_limit))
  end

  test "should show pay_limit" do
    get :show, id: @pay_limit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_limit
    assert_response :success
  end

  test "should update pay_limit" do
    patch :update, id: @pay_limit, pay_limit: { amount: @pay_limit.amount, project_id: @pay_limit.project_id, user_id: @pay_limit.user_id }
    assert_redirected_to pay_limit_path(assigns(:pay_limit))
  end

  test "should destroy pay_limit" do
    assert_difference('PayLimit.count', -1) do
      delete :destroy, id: @pay_limit
    end

    assert_redirected_to pay_limits_path
  end
end
