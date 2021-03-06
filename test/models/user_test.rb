require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end 

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

 test "name should not be too long" do
    @user.name = "a" * 26
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
 
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid? 
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated posts should be destroyed" do
    @user.save
    @post = @user.posts.create!(content: "Lorem ipsum")
    @user.replies.create!(content: "a reply", post: @post)
    assert_difference ['Post.count', 'Reply.count'] , -1 do
      @user.destroy
    end
  end

  test "should unfollow and follow a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert michael.following?(archer)
    michael.unfollow(archer)
    assert_not michael.following?(archer)
    assert archer.unfollowers.include?(michael)
    michael.follow(archer)
    assert michael.following?(archer)
  end

  test "feed should have the right posts" do
    michael = users(:michael)
    archer =  users(:archer)
    lana =    users(:lana)
    # Posts from followed user
    archer.posts.each do |post_following|
      assert michael.feed.include?(post_following)
    end
    # Posts from self
    michael.posts.each do |post_self|
      assert michael.feed.include?(post_self)
    end
    # Posts from unfollowed user
    lana.posts.each do |post_unfollowed|
      assert_not michael.feed.include?(post_unfollowed)
    end
  end

end
