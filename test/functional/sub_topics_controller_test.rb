require 'test_helper'

class SubTopicsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_topic" do
    assert_difference('SubTopic.count') do
      post :create, :sub_topic => { }
    end

    assert_redirected_to sub_topic_path(assigns(:sub_topic))
  end

  test "should show sub_topic" do
    get :show, :id => sub_topics(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sub_topics(:one).to_param
    assert_response :success
  end

  test "should update sub_topic" do
    put :update, :id => sub_topics(:one).to_param, :sub_topic => { }
    assert_redirected_to sub_topic_path(assigns(:sub_topic))
  end

  test "should destroy sub_topic" do
    assert_difference('SubTopic.count', -1) do
      delete :destroy, :id => sub_topics(:one).to_param
    end

    assert_redirected_to sub_topics_path
  end
end
