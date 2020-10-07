class ProfilesController < ApplicationController
  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find_by(params[:Name])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find_by(params[:Name])
  end

  def update
    @profile = Profile.find_by(params[:Name])

    if @profile.update(profile_params)
      redirect_to user_profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile = Profile.find_by(params[:Name])
    @profile.destroy

    redirect_to @profile
  end

  private
  def profile_params
    params.require(:profile).permit(:Name, :Email, :Phone, :Bio)
  end
end
