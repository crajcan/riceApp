Rails.application.routes.draw do

  root 'application#front'   
  get  '/contact', :to =>   'static_pages#contact'
  get  '/help', :to =>      'static_pages#help'
  get  '/about', :to =>     'static_pages#about'
  get  '/signup',:to =>     'users#new'
  post '/signup',:to =>     'users#create'

end
