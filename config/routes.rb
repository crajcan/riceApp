Rails.application.routes.draw do

  get 'access_codes/new'

  get 'access_codes/create'

  get 'access_codes/destroy'

  get 'replies/create'

  get 'replies/destroy'


  root 'application#front'   
  get  '/contact', :to =>      'static_pages#contact'
  get  '/help', :to =>         'static_pages#help'
  get  '/about', :to =>        'static_pages#about'
  get  '/home', :to =>         'static_pages#home'
  get 'calendar' =>            'static_pages#calendar'
  get  '/login', :to =>        'sessions#new'
  post '/login', :to =>        'sessions#create'
  delete '/logout', :to =>     'sessions#destroy'
  get  '/signup',:to =>        'users#new'
  post '/signup',:to =>        'users#create' 
  get '/access_codes' =>       'access_codes#new'
  get '/deactivate' =>         'users#deactivate'
  post '/relationships/:id' => 'relationships#create'



  resources :users do
    member do
      get :unfollowing
    end
  end
  get  '/settings', :to =>  'users#settings'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,               only: [:create, :destroy, :show]
  resources :replies,             only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :access_codes,        only: [:new, :create , :destroy]

end
