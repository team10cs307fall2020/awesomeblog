class ProfilesController < ApplicationController
  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find_by(Name: current_user.username)
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
    @profile = Profile.find(params[:user_id])
  end

  def update
    @profile = Profile.find(params[:user_id])

    if @profile.update(profile_params)
      redirect_to user_profile_path(@profile)
    else
      render 'edit'
    end
  end

  def view
    @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:user_id])
    @profile.destroy

    redirect_to @profile
  end

  private
  def profile_params

    params.require(:profile).permit(:Name, :Email, :Phone, :gender, :Bio, :picture, :privacy)

  end
end