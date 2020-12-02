Rails.application.routes.draw do


  get 'topics/index'
  resources :topics

  get 'followings/index'
  get 'followings/follower'
  resources :followings

  post 'followings/new', to: 'followings#create'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'users/index'
  get 'users/signup'
  get 'users/view'
  get 'users/show'
  get 'users/userline'

  get 'users/follow_user'
  
  get "/upvote" => "posts#upvote"
  get "/downvote" => "posts#downvote"

  get 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'view'
      get 'userline'

      get 'follow_user'

    end
    resources :profiles do
      member do
        get 'view'
      end
    end

    resources :followings do
      member do
        get 'follow_user'
      end
    end

  end
  root "sessions#login"


  get 'profiles/show'
  get 'profiles/view'

  # root 'profiles#show'

  get 'posts/index'
  get 'posts/show'
  get 'posts/view'
  get 'posts/userline'


  get 'followings/index'
  get 'followings/show'


  resources :posts do
    member do
      get 'view'
      get 'userline'
    end
    resources :comments
  end

  resources :followings do
    member do
      get 'follow_user'
      get 'view'

    end
    resources :comments
  end

  # root 'post#index'

  get 'profiles/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'profiles#edit'


end
