Rails.application.routes.draw do


  get 'topics/index'
  resources :topics


  get 'users/login'
  get 'users/signup'
  resources :users
  root "users#login"


  get 'profiles/show'
  resources :profiles
  
  # root 'profiles#show'

  get 'post/index'
  resources :posts do
    resources :comments
  end
  
  # root 'post#index'
  
  get 'profiles/edit'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'profiles#edit'


end
