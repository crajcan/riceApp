require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @last_user = users(:lana)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_response :redirect
    follow_redirect! 
    assert_select '.paginate'
    # Invalid submission
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "" } }
    end
    assert_redirected_to '/home'
    follow_redirect!
    assert_select 'div.alert'
    # Valid submission
    content = "This micropost really ties the room together"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content } }
    end
    assert_redirected_to '/home'
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # Visit different user (no delete links)
    log_in_as(@last_user)
    get user_path(users(:michael))
    assert_select 'a', text: 'delete', count: 1 
  end

end
