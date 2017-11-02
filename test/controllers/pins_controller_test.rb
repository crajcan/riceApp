require 'test_helper'

class PinsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @pin = pins(:one)
    @pin2 = pins(:two)
    @post = posts(:ants)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Pin.count' do
      post pins_path, params: { post: @post }
    end
  end
 
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Pin.count' do
      delete pin_path(@pin)
    end
    assert_response :redirect
  end
 
  test "should redirect direct destroy for wrong pin" do
    log_in_as(users(:lana))
    assert_no_difference 'Pin.count' do
      delete pin_path(@pin)
    end
  end

  test "should create correctly" do
    log_in_as(users(:lana))
    assert_difference 'Pin.count', 1 do
      post pins_path, params: { post_id: @post.id }
    end
  end

  test "should delete correctly" do
    log_in_as(users(:lana))
    assert_difference 'Pin.count', -1 do
      delete pin_path(@pin2)
    end
  end

end
