require 'test_helper'

class Api::TodoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_todo_show_url
    assert_response :success
  end

  test "should get index" do
    get api_todo_index_url
    assert_response :success
  end

  test "should get create" do
    get api_todo_create_url
    assert_response :success
  end

  test "should get update" do
    get api_todo_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_todo_destroy_url
    assert_response :success
  end

end
