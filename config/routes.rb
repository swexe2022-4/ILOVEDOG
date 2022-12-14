Rails.application.routes.draw do

  #get 'users/index'
  #get 'users/new'
  #get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'items#index'
  #root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',    to: 'top#new'
  post   '/login',    to: 'top#create'
  delete '/logout',   to: 'top#destroy'
  resources :users
  resources :dogs
  resources :items
end
