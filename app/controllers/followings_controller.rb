class FollowingsController < ApplicationController
  def index
    @following = Following.all
  end

  def new
    @following = Following.new
  end

  def create
    @user = current_user
    @following = @user.followings.new(following_params)
    if @following.save

      redirect_to @following, notice: "followed!"
    else
      flash[:notice] = "Not followed!"
      render 'new'
    end
  end

  def show
    @following = Following.find(params[:id])
  end

  def follow_user

    @user = current_user
    if Following.exists?(:user_id => @user.id, :name => params[:name])

      redirect_to followings_path, notice: "You've already followed this user!" and return
    end
    @target = User.find(params[:id])
    @following = Following.new(following_params)
    @following.user = @user
    if @following.save

      redirect_to @following, notice: "followed!"
    else
      flash[:notice] = "Not followed!"
      redirect_to following_path, warn: "You've already followed this user!"
    end
  end


  def edit
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    flash[:notice] = "Unfollowed!"
    redirect_to followings_path
  end

  def view
    @user = User.find(params[:id])
  end

  def following_params
    params.permit(:name, :category)
  end
end
