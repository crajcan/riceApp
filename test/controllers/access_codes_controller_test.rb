require 'test_helper'

class AccessCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get access_codes_new_url
    assert_response :success
  end

  test "should get create" do
    get access_codes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get access_codes_destroy_url
    assert_response :success
  end

end
