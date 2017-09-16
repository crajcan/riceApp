require 'test_helper'

class UnfollowingTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael)
    log_in_as(@user)
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

end
