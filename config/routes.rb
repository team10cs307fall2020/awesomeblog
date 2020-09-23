Rails.application.routes.draw do


  get "user/log_in" => "user#login"
  get "user/sign_up" => "user#signup"
  root "user#login"




end
