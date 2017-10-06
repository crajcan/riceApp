class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  after_action :clear_xhr_flash

  def front 
    redirect_to '/home' if logged_in?
  end

  private

    def user_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def clear_xhr_flash
      if request.xhr?
        flash.discard
      end
    end


end
