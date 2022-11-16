Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/new'
  resources :users
  #root 'users#index'
  root 'top#main'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
