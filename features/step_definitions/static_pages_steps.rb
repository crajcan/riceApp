require 'cucumber'

Given /^Nothing$/ do
  nil
end  

When I /^navigate to the help page$/ do
  visit '/help'
end

When I /^navigate to the about page$/ do
  visit '/about'
end

When I /^navigate to the contact page$/ do
  visit '/contact'
end

Then /^I am on the help page$/ do
  current_page.should == help_url
end

TThen /^I am on the about page$/ do
  current_page.should == about_url
end

hen /^I am on the contact page$/ do
  current_page.should == contact_url
end

Then /^The title says help$/ do
  page.title.include? "Help"  
end

Then /^The title says about$/ do
  page.title.include? "About"  
end

Then /^The title says contact$/ do
  page.title.include? "Contact"  
end
