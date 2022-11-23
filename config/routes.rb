Rails.application.routes.draw do
  resources :users
  root 'top#main'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  #get 'users/index'
  #get 'users/new'
  #get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
