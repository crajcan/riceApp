require 'test_helper'
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = APP_NAME
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "#{@base_title} | Contact"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "#{@base_title} | Help"

  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "#{@base_title} | About"
  end


end 
