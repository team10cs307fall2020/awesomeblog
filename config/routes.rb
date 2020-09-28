Rails.application.routes.draw do

  get 'profiles/show'
  resources :profiles
  
  # root 'profiles#show'


  get "user/log_in" => "user#login"
  get "user/sign_up" => "user#signup"
  root "user#login"

  get 'post/index'
  resources :posts do
    resources :comments
  end
  
  # root 'post#index'
  
  get 'profiles/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'profiles#edit'


end
