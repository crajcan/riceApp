require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @post = @user.posts.build(content: "Lorem ipsum")
  end

  test "should be valid" do 
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content or photo should be present" do
    assert @post.valid?
    @post.content = " "
    assert_not @post.valid?
  end

  test "content should be at most 3000 characters" do
    @post.content = "a" * 3001
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

  test "title, location, time should be present if event is true" do
    assert @post.valid?
    @post.event = true
    assert_not @post.valid?
    @post.title = "a"
    @post.event_time = Time.now
    @post.event_location = "My house"
    assert @post.valid?

    @post.title = nil
    assert_not @post.valid?
    @post.title = "A"
    assert @post.valid?

    @post.event_time = nil
    assert_not @post.valid?
    @post.event_time = Time.now
    assert @post.valid?

    @post.event_location = nil
    assert_not @post.valid?
    @post.event_location = "A"
    assert @post.valid?
  end

  test "title, and location should be less than 100 chars" do
    assert @post.valid?
    @post.event = true
    @post.title = "a"
    @post.event_time = Time.now
    @post.event_location = "my place"
    
    assert @post.valid?
    
    @post.title = "a" * 101
    assert_not @post.valid?
    @post.title = "a" 
    assert @post.valid?   
    
    @post.event_location = "a" * 101
    assert_not @post.valid?
    @post.event_location = "a" 
    assert @post.valid?   
  end

end
