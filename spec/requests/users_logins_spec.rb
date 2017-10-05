
RSpec.describe "user login", type: :feature do
  describe "login interface" do
    fixtures :all

    it "logs in an out" do
      @user = users(:michael)
      visit login_path
      expect(page).to have_current_path(login_path)
      expect(page).not_to have_content('Log in')
      expect(page).not_to have_content('Sign Up')
      find(:css, '#burger').click
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign Up')
      fill_in('Email', :with => @user.email)
      fill_in('Password', :with => 'password')
      click_button('Log in')
      expect(page).to have_current_path('/home')  
      expect(page).not_to have_content('Log out')
      find(:css, '#burger').click
      expect(page).to have_content('Log out')
      expect(page).not_to have_content('Log in')
      click_link('Log out')
      expect(page).to have_current_path(login_path)
      expect(page).to have_xpath('.//h3', :text => 'Login', :visible => true)
    end
  
  end
end

