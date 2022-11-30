Rails.application.routes.draw do
  resources :users
  root   'static_pages#home'
  # root 'top#main'
  get 'top/main'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  #get 'users/index'
  #get 'users/new'
  #get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs
end
