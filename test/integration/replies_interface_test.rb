require 'test_helper'

class RepliesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael) 
    @other_user = users(:archer)
    @post = posts(:orange)
    @reply1 = replies(:one)
    @reply2 = replies(:two)
  end

  test "reply interface" do
    log_in_as(@user)
    get root_path
    assert_response :redirect
    follow_redirect!
    assert_match 'Reply1', response.body
    assert_match 'Reply2', response.body
    #Invalid submission
    assert_no_difference 'Reply.count' do
      post replies_path, params: { reply: { content: "",
                                            user_id: @other_user.id,
                                            post_id: @post.id } } 
    end
    assert_redirected_to '/home'
    follow_redirect!
    assert_select 'div.alert'    
    #valid submission
    assert_difference 'Reply.count', 1 do
      post replies_path, params: { reply: { content: "Reply3",
                                            user_id: @other_user.id,
                                            post_id: @post.id } }
    end
    #admin delete reply
    assert_redirected_to '/home'
    follow_redirect!
    assert_match 'Reply3', response.body
    assert_difference 'Reply.count', -1 do
      delete reply_path(Reply.last)
    end
    assert_redirected_to '/home'
    follow_redirect!
    assert_no_match 'Reply3', response.body
    #delete own reply
    log_in_as(users(:lana))
    assert_difference 'Reply.count', -1 do
      delete reply_path(replies(:two))
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_redirected_to '/home'
    follow_redirect!
    assert_no_match 'Reply2', response.body
  end  

end
