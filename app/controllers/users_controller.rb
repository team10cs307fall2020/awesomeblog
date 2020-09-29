class UsersController < ApplicationController
  def login
  end

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_login_path
    else
      render 'signup'
    end
  end


  def signup
    @user = User.new
  end

  private def show
    @user = User.find(params:[:id])
  end

  private def edit
    @user = User.find(params:[:id])
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

  private def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User was deleted"
    redirect_to users_path
  end

  private def user_params
    params.require(:user).permit(:password, :username, :email, :password_confirmation)
  end


end






