Rails.application.routes.draw do

  resources :saledetails
  resources :sales
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'secret/private'

  get 'secret/public'

  resources :promotions
  resources :advertisements
  resources :advertisments
  get 'report/prodlist'

  get 'report/salelist'

  get 'report/reportmenu'

  get 'report/custlist'
  
  get 'home/askname'
  
  post 'home/askname'
  
  get 'home/search'
  post 'home/search'

  resources :suppliers
  resources :products
  resources :reorders
  resources :categories
  resources :reviews
  resources :trandetails
  resources :transactions
  resources :customers
  
  get 'home/index'

  get 'home/about'

  get 'home/contact'
  
  get 'home/privacy'
  
  get 'home/help'
  
  get 'home/catalog'
  
  root 'home#index'
  
  post 'home/buy'
  post 'home/updatecart'
  post 'home/checkout'
  get 'cart', to: 'home#cart', as: 'cart'


  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
