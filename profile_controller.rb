class ProfileController < ApplicationController
  def new
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
      redirect_to @profile
    else
      render 'edit'
  end


  def destroy
    @profile = Profile.find(params[:user_id])
    @profile.destroy
  
    redirect_to profile_path
  end

  
  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find(params[:user_id])
  end




 

  private
  def profile_params
    params.require(:profile).permit(:title, :content)
  end

end
