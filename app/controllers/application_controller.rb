class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def front 
    redirect_to '/home' if logged_in?
  end

end
