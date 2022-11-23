Rails.application.routes.draw do
<<<<<<< HEAD
  resources :users
  root 'top#main'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  #get 'users/index'
  #get 'users/new'
  #get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs
=======
  resources :dogs
  root 'dogs#index'
>>>>>>> da4a416dc0d88633c0ee785479c1d2ba43062478
end
