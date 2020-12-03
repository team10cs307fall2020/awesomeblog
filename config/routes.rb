Rails.application.routes.draw do


  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'conversations/index'
  get 'conversations/create'
  get 'blocks/index'
  get 'blocks/new'
  get 'blocks/create'
  get 'blocks/show'
  get 'blocks/block_user'
  get 'blocks/blocked'
  get 'blocks/destroy'

  get 'blocks/view'
  get 'topics/index'
  resources :topics

  get 'followings/index'
  get 'followings/follower'
  resources :followings

  get 'blocks/index'
  get 'blocks/blocked'
  resources :blocks

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

    resources :blocks do
      member do
        get 'block_user'
      end
    end

  end
  root "sessions#login"


  get 'profiles/show'
  get 'profiles/view'

  # root 'profiles#show'

  resources :conversations do
    resources :messages
  end

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

  resources :blocks do
    member do
      get 'block_user'
      get 'view'

    end
    resources :comments
  end

  # root 'post#index'

  get 'profiles/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'profiles#edit'


end
