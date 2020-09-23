Rails.application.routes.draw do
  get "user/log_in" => "user#login"
  get "user/sign_up" => "user#signup"
  root "user#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
