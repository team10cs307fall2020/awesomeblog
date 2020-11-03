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
      # flash.now[:notice]= params[:password]
      # flash.now[:notice]= user.password
      # Encrypt password and Compare
      if user.password == Digest::MD5.hexdigest(params[:password])
        #login user set current_user
        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end
        flash.now[:notice]= "Logged In"
        redirect_to '/welcome'
      else
        flash.now[:alert]= "Wrong Password!"
        render 'login'
      end
    end

  end                                                      

  def welcome
  end

  def destroy
    cookies.delete(:auth_token)
    flash.now[:notice] = "Logged out"
    redirect_to '/login'
  end
end