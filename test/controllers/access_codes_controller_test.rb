require 'test_helper'

class AccessCodesControllerTest < ActionDispatch::IntegrationTest

  test "should get new if logged in as admin" do
    log_in_as(users(:michael))
    get access_codes_new_url
    assert_response :success
  end

  test "new,create,destroy redirect if not logged in" do
    get access_codes_new_url
    assert_response :redirect
    follow_redirect!
    post access_codes_path, params: { access_code: { code: "new_code" } } 
    follow_redirect!
    delete access_code_path(access_codes(:one).id)
    assert_response :redirect
    follow_redirect!
  end

  test "new,create,destroy redirect if logged in as non-admin" do
    log_in_as(users(:archer))
    get access_codes_new_url
    assert_response :redirect
    follow_redirect!
    post '/access_codes', params: { access_code: { code: "new_code" } } 
    follow_redirect!
    delete access_code_path(access_codes(:one).id)
    assert_response :redirect
    follow_redirect!
  end

end
