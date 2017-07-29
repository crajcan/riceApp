require 'cucumber'

When /^I navigate to the front page$/ do
  visit '/'
end  

Then /^I am on the front page$/ do
  current_path.should == root_url
end

Then /^The title says We Are Pivoting$/ do
  page.title.include? "We Are Pivoting"
end

When /^I navigate to the front page$/ do
  visit '/login'
end  

Then /^I am on the login page$/ do
  current_path.should == login_url
end

Then /^The title says Login$/ do
  page.title.include? "Login"   
end
 
