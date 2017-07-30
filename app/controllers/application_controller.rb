class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def login
    #render html: "log in bitch!"
  end
end
