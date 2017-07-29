class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @name = 'nick'
  end

  def login
    #render html: "log in bitch!"
  end
end
