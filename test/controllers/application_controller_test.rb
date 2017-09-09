require 'test_helper'
class ApplicationControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = APP_NAME 
  end
  
  test "should get login" do
    get login_url
    assert_response :success
    assert_select "title", "#{@base_title} | Login"
  end


  test "should get root" do 
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title} | Welcome"
  end

end
