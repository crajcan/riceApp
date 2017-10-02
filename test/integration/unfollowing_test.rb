require 'test_helper'

class UnfollowingTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael)
    log_in_as(@user)
    @other = users(:archer)
  end

  test "unfollowing page" do
    get unfollowing_user_path(@user)
    assert_not @user.unfollowing.empty?
    assert_match @user.unfollowing.count.to_s, response.body
    @user.unfollowing.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "feed on Home page" do
    get root_path
    assert_redirected_to '/home'
    follow_redirect!  
    @user.feed.paginate(page: 1).each do |post|
      assert_match CGI.escapeHTML(post.content), response.body
    end
  end

  test "should unfollow a user the standard way" do
    assert_difference '@user.unfollowing.count', 1 do
      post relationships_path, params: { unfollowed_id: @other.id }
    end
  end
  
  test "should unfollow a user with Ajax" do
    assert_difference '@user.unfollowing.count', 1 do
      post relationships_path, xhr: true, params: { unfollowed_id: @other.id }
    end
  end
  
  test "should follow a user the standard way" do
    @user.unfollow(@other)
    relationship = @user.active_relationships.find_by(unfollowed_id: @other.id)
    assert_difference '@user.unfollowing.count', -1 do
      delete relationship_path(relationship)
    end
  end
  
  test "should follow a user with Ajax" do
    @user.unfollow(@other)
    relationship = @user.active_relationships.find_by(unfollowed_id: @other.id)
    assert_difference '@user.unfollowing.count', -1 do
      delete relationship_path(relationship), xhr: true
    end
  end
end
