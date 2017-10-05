ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#require 'capybara/rails'
#require 'capybara/minitest'
require 'minitest/reporters'
#require 'capybara-screenshot/minitest'
Minitest::Reporters.use!
ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...


  def is_logged_in? 
    !session[:user_id].nil?
  end


  def log_in_as(user)
    session[:user_id] = user.id
  end
=begin
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end  
=end
  
end

class ActionDispatch::IntegrationTest

  
  #include Capybara::DSL
  #Capybara.default_driver = :selenium

  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }  
  end
end
