Rails.application.routes.draw do

  get 'static_pages/contact'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  root 'application#home'

  get '/signin', :to => 'application#login'

end
