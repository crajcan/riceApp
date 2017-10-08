module BasicHelper
  extend Capybara::DSL   
 
  def self.log_in_as(user, password = 'password')
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => password)
    click_button('Log in')
  end

end
