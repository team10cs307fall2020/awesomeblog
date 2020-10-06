class SessionsController < ApplicationController
  def new
  end

  #find user matching username-password
  def create
    user = User.find_by(username: params[:username])
    if user.nil?
      flash.now[:alert]= "Invalid User!"
      render 'login'
    else
      if user.password == params[:password]
        #login user set current_user
        session[:user_id] = user.id
        flash.now[:notice]= "Logged In"
        redirect_to '/welcome'
      else
        flash.now[:alert]= "Wrong Password!"
        render 'login'
      end
    end

  end

  def login
  end

  def welcome
  end
end