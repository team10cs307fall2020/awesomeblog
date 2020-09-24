class ProfilesController < ApplicationController
  def edit
  end
  
  def new
  end
 
  def create
    @profiles = Profiles.new(params[:article])
 
    @profiles.save
    redirect_to @profiles
  end
end
