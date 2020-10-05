class UsersController < ApplicationController
  def login
    render 'login'
  end

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.create(Name: @user.username, Email: @user.email, Phone: "", Bio: "")
    if @user.save
      redirect_to users_login_path
    else
      render 'signup'
    end
  end


  def signup
    @user = User.new
  end

  def show
    @user = User.find_by_username(params[:username])
    @profile = @user.profile
    redirect_to user_profile_path(@profile)
  end

  private def edit
    @user = User.find(params[:id])
  end

  private def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User was updated"
      redirect_to @user
    else
      flash[:notice] = "User was not updated"
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by_username(params[:username])
    @user.destroy
    flash[:notice] = "User was deleted"
    redirect_to 'login'
  end

  private def user_params
    params.require(:user).permit(:password, :username, :email, :password_confirmation)
  end

end






