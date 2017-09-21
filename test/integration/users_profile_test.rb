require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h3', text: @user.name
    assert_select '.paginate'
    @user.profile_feed.paginate(page: 1).each do |post|
      assert_match post.content, response.body
    end
  end

end
