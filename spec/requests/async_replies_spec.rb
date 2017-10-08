require 'rails_helper'

RSpec.describe "AsyncReplies", type: :feature do
  describe "The Interface" do   
    fixtures :all
    
    it "allows you to POST and DELETE replies" do
      @user = users(:archer)
      visit login_path
      expect(page).to have_current_path(login_path)
      fill_in('Email', :with => @user.email)
      BasicHelper.log_in_as(@user)
      expect(page).to have_current_path('/home') 
      expect(page).not_to have_content('post reply')
      reply_opens = page.all(".reply-open") 
      reply_opens[2].click
      expect(find_button('post reply').visible?).to be true
      fill_in("reply[content]", :with => "This is my test reply")
      click_button('post reply')
      expect(page).to have_content('This is my test reply')
      expect(page).to have_css('.alert-success')
      expect(page).to have_content('Reply created')
    end

  end
end
