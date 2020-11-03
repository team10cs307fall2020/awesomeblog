class ApplicationController < ActionController::Base

  #todo Uncomment before_action when tests finished

  #helper methods for recognizing current user
  # helper method for checking whether the user is logged in
  #before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= cookies[:auth_token] && User.find_by(auth_token:cookies[:auth_token])
  end
  def logged_in?

    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
