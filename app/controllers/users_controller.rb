require 'digest/md5'
class UsersController < ApplicationController
  #skip_before_action :authorized
  def new
    @user = User.new
  end

  def index
    @user = User.all
  end
  #todo Create post/profile object when new user created
  def create
    @user = User.new(user_params)
    @user.profile = Profile.create(Name: @user.username, Email: @user.email)
    #@user.build_profile(Email: params[:email], Name: params[:username])
    session[:user_id] = @user.id

    # Check before encrypt
    unless @user.valid?
      @user.errors
      render 'signup'
      return
    end
    # Encrypt
    @user.password = Digest::MD5.hexdigest(@user.password)
    @user.password_confirmation = Digest::MD5.hexdigest(@user.password_confirmation)
    #flash.now[:alert] = @user.password

    if @user.save!(:validate => false)  # Encrypt ignores validation
      #if @user.profile.save
      redirect_to login_path, notice: "User created!"
      #else
      #flash.now[:alert] = "Profile creation failed!"
      #end
    else
      render 'signup'
    end
  end


  def signup
    @user = User.new
  end

  def show
    @user = User.find_by(params[:username])
    @profile = @user.profile
    redirect_to user_profile_path(@profile)
  end

  def view
    @user = User.find_by(params[:username])
    @profile = @user.profile
    redirect_to profiles_view_path(@profile)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
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
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User was deleted"
    redirect_to login_path
  end

  private def user_params
    params.require(:user).permit(:password, :username, :email, :password_confirmation)
  end

end






