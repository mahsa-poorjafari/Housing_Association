require 'test_helper'

class CommentComplaintsControllerTest < ActionController::TestCase
  setup do
    @comment_complaint = comment_complaints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_complaints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_complaint" do
    assert_difference('CommentComplaint.count') do
      post :create, comment_complaint: { complaint_id: @comment_complaint.complaint_id, text: @comment_complaint.text, user_id: @comment_complaint.user_id }
    end

    assert_redirected_to comment_complaint_path(assigns(:comment_complaint))
  end

  test "should show comment_complaint" do
    get :show, id: @comment_complaint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_complaint
    assert_response :success
  end

  test "should update comment_complaint" do
    patch :update, id: @comment_complaint, comment_complaint: { complaint_id: @comment_complaint.complaint_id, text: @comment_complaint.text, user_id: @comment_complaint.user_id }
    assert_redirected_to comment_complaint_path(assigns(:comment_complaint))
  end

  test "should destroy comment_complaint" do
    assert_difference('CommentComplaint.count', -1) do
      delete :destroy, id: @comment_complaint
    end

    assert_redirected_to comment_complaints_path
  end
end
