require 'test_helper'

class FollowingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get following_index_url
    assert_response :success
  end

  test "should get new" do
    get following_new_url
    assert_response :success
  end

  test "should get create" do
    get following_create_url
    assert_response :success
  end

  test "should get show" do
    get following_show_url
    assert_response :success
  end

  test "should get edit" do
    get following_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get following_destroy_url
    assert_response :success
  end

end
