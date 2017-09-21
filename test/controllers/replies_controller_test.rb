require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @lana = users(:lana)
    @reply = replies(:one)
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Reply.count' do
      post replies_path, params: { reply: { content: "Lorem ipsum",
                                            user_id: 1,
                                            post_id: 1  } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Reply.count' do
      delete reply_path(@reply)
    end 
    assert_redirected_to login_url
  end

  test "should redirect destroy if not admin, reply owner, or post owner" do
    log_in_as(@lana)
    assert_no_difference 'Reply.count' do 
      delete reply_path(@reply)
    end
    assert_redirected_to root_url
  end

end
