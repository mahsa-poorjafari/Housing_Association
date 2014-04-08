require 'test_helper'

class CooperativesControllerTest < ActionController::TestCase
  setup do
    @cooperative = cooperatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cooperatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cooperative" do
    assert_difference('Cooperative.count') do
      post :create, cooperative: { address: @cooperative.address, board_Chairman_name: @cooperative.board_Chairman_name, managment_name: @cooperative.managment_name, name: @cooperative.name, phone: @cooperative.phone, website: @cooperative.website }
    end

    assert_redirected_to cooperative_path(assigns(:cooperative))
  end

  test "should show cooperative" do
    get :show, id: @cooperative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cooperative
    assert_response :success
  end

  test "should update cooperative" do
    patch :update, id: @cooperative, cooperative: { address: @cooperative.address, board_Chairman_name: @cooperative.board_Chairman_name, managment_name: @cooperative.managment_name, name: @cooperative.name, phone: @cooperative.phone, website: @cooperative.website }
    assert_redirected_to cooperative_path(assigns(:cooperative))
  end

  test "should destroy cooperative" do
    assert_difference('Cooperative.count', -1) do
      delete :destroy, id: @cooperative
    end

    assert_redirected_to cooperatives_path
  end
end
