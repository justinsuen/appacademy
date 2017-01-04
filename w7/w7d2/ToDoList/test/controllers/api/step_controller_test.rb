require 'test_helper'

class Api::StepControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_step_show_url
    assert_response :success
  end

  test "should get create" do
    get api_step_create_url
    assert_response :success
  end

  test "should get update" do
    get api_step_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_step_destroy_url
    assert_response :success
  end

end
