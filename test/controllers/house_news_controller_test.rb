require 'test_helper'

class HouseNewsControllerTest < ActionController::TestCase
  setup do
    @house_news = house_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:house_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house_news" do
    assert_difference('HouseNew.count') do
      post :create, house_news: { Important: @house_news.Important, number_Visit: @house_news.number_Visit, text: @house_news.text, title: @house_news.title }
    end

    assert_redirected_to house_news_path(assigns(:house_news))
  end

  test "should show house_news" do
    get :show, id: @house_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house_news
    assert_response :success
  end

  test "should update house_news" do
    patch :update, id: @house_news, house_news: { Important: @house_news.Important, number_Visit: @house_news.number_Visit, text: @house_news.text, title: @house_news.title }
    assert_redirected_to house_news_path(assigns(:house_news))
  end

  test "should destroy house_news" do
    assert_difference('HouseNew.count', -1) do
      delete :destroy, id: @house_news
    end

    assert_redirected_to house_news_path
  end
end
