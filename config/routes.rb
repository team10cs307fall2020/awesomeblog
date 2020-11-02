Rails.application.routes.draw do


  get 'topics/index'
  resources :topics


  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'users/index'
  get 'users/signup'
  get 'users/view'
  get 'users/show'
  get 'logout', to: 'sessions#destroy'
  resources :users do
    resources :profiles
  end
  root "sessions#login"


  get 'profiles/show'
  get 'profiles/view'

  # root 'profiles#show'

  get 'post/index'
  get 'post/show'
  resources :posts do
    resources :comments
    member do
      get 'upvote' => 'posts#upvote', as: :upvote
      get 'downvote' => 'posts#downvote', as: :downvote
    end
  end

  # root 'post#index'

  get 'profiles/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'profiles#edit'


end
