require 'rails_helper'

RSpec.describe "AsyncReplies", type: :feature do
  describe "The Interface" do   
    fixtures :all

    it "allows you to POST and DELETE replies with http" do
      @user = users(:archer)
      visit login_path
      expect(page).to have_current_path(login_path)
      fill_in('Email', :with => @user.email)
      BasicHelper.log_in_as(@user)
      expect(page).to have_current_path('/home') 
      expect(page).not_to have_content('post reply')
      reply_opens = page.all(".reply-open") 
      reply_opens.third.click
      expect(page).to have_content('post reply')
    end


    it "allows you to POST and DELETE replies with ajax" do
  
    end

  end
end
