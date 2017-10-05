require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
=begin
  test "login with valid information followed by logout" do
    visit login_path
    assert page.has_xpath?('.//h3', :text => 'Login', :visible => true)
    assert page.title.include?("Login")   
    
    #binding.pry
    
    page.fill_in('#email', :with => @user.email)
    #fill_in('Password', :with => 'password')
    #save_and_open_page 
    #click_button('Log in')
    #post login_path, params: { session: { email: @user.email, password: 'password' } }
        

    #assert page.title.include?("Home")
    #find(:css, '#burger').click
    #assert page.has_no_xpath?('.//a', :text => 'Log in', :visible => true)
    #assert page.has_xpath?('.//a', :text => 'Logout', :visible => true)
    #assert f(page, have_current_path('/home')
    #assert_not find_link('Log in').visible?
    #assert_not (page.has_css? ("a", :text => 'Log in'))
    #assert_not (page.has_css? ("a", :text => 'Sign up'))
    #assert (page.has_css? ("a", :text => 'Log out'))
    #assert (page.has_css? ("a", :text => 'Profile'))
    #delete logout_path
    #assert_not is_logged_in?
    #assert_redirected_to root_url
    #delete logout_path
    #follow_redirect!
    #assert_select "a[href=?]", login_path
    #assert_select "a[href=?]", signup_path
    #assert_select "a[href=?]", logout_path,      count: 0
    #assert_select "a[href=?]", user_path(@user), count: 0
  end
=end 

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do 
    log_in_as(@user, remember_me: '1')
   
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end

end
