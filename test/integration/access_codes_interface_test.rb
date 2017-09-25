require 'test_helper'

class AccessCodesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:michael)
    @access_code = access_codes(:one)
  end

  test "access_codes interface" do
    log_in_as(@admin)
    get access_codes_new_url 
    assert_response :success
    assert_match "Add an Access Code", response.body
    post access_codes_path, params: { access_code: { code: "new_code" } }
    assert_response :redirect
    follow_redirect!
    assert_not flash.empty?
    assert_match "new_code", response.body 
    delete access_code_path(AccessCode.last.id)
    assert_response :redirect
    follow_redirect!
    assert_not flash.empty?
    assert_match "Code removed.", response.body
  end

end
