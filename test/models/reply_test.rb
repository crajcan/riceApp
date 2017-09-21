require 'test_helper'

class ReplyTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @post = posts(:orange) 
    @reply = @user.replies.build(content: "My first post", post: @post)
    @reply1 = replies(:one)
    @reply2 = replies(:two)
  end

  test "should be valid" do
    assert @post.valid?
  end
  
  test "user_id should be present" do
    @reply.user_id = nil
    assert_not @reply.valid? 
  end

  test "post should be present" do
    @reply.post = nil
    assert_not @reply.valid?
  end

  test "content should be present" do
    @reply.content = "  "
    assert_not @reply.valid?
  end

  test "content should be at most 1500 characters" do
    @reply.content = "a" * 1501
    assert_not @reply.valid?
  end 

  test "order should be most recent last" do
    assert_equal @reply1, Reply.last
  end
end


