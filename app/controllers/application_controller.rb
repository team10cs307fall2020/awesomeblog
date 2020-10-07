class ApplicationController < ActionController::Base

  #todo Uncomment before_action when tests finished

  #helper methods for recognizing current user
  # helper method for checking whether the user is logged in
  #before_action :authorized
  #before_action :set_browser_uid
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?

    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  #def set_browser_uid
    #uid = cookies[:user]
  #end
end
