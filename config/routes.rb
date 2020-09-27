Rails.application.routes.draw do
  get 'profiles/show'
  resources :profiles
  root 'profiles#show'
end
