Given /^Nothing$/ do
  #yep
end  

When /^I navigate to the home page$/ do
  visit '/static_pages/home'
end  

Then /^I am on the home page$/ do
  current_path.should == static_pages_home_url
end

When I /^navigate to the help page$/ do
  visit '/static_pages/help'
end

Then /^I am on the help page$/ do 
  current_path.should == static_pages_help_url
end

When I /^navigate to the about page$/ do
  visit '/static_pages/about'
end

Then /^I am on the about page$/ do
  current_page.should == static_pages_about_url
end

Then /^The title says home$/ do
  
end

Then /^The title says help$/ do

end

Then /^The title says about$/ do

end

