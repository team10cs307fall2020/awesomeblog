require 'test_helper'

class BlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blocks_index_url
    assert_response :success
  end

  test "should get new" do
    get blocks_new_url
    assert_response :success
  end

  test "should get create" do
    get blocks_create_url
    assert_response :success
  end

  test "should get show" do
    get blocks_show_url
    assert_response :success
  end

  test "should get block_user" do
    get blocks_block_user_url
    assert_response :success
  end

  test "should get blocked" do
    get blocks_blocked_url
    assert_response :success
  end

  test "should get destroy" do
    get blocks_destroy_url
    assert_response :success
  end

  test "should get view" do
    get blocks_view_url
    assert_response :success
  end

end
