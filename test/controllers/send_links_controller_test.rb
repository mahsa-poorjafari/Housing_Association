require 'test_helper'

class SendLinksControllerTest < ActionController::TestCase
  setup do
    @send_link = send_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:send_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send_link" do
    assert_difference('SendLink.count') do
      post :create, send_link: { current_link: @send_link.current_link, receiver_email: @send_link.receiver_email, sender_email: @send_link.sender_email, subject: @send_link.subject, text: @send_link.text }
    end

    assert_redirected_to send_link_path(assigns(:send_link))
  end

  test "should show send_link" do
    get :show, id: @send_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send_link
    assert_response :success
  end

  test "should update send_link" do
    patch :update, id: @send_link, send_link: { current_link: @send_link.current_link, receiver_email: @send_link.receiver_email, sender_email: @send_link.sender_email, subject: @send_link.subject, text: @send_link.text }
    assert_redirected_to send_link_path(assigns(:send_link))
  end

  test "should destroy send_link" do
    assert_difference('SendLink.count', -1) do
      delete :destroy, id: @send_link
    end

    assert_redirected_to send_links_path
  end
end
