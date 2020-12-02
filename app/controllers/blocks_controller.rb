class BlocksController < ApplicationController
  def index
    @block = Block.all
  end

  def new
    @block = Block.new
  end

  def create
    @user = current_user
    @block = @user.blocks.new(block_params)
    if @block.save

      redirect_to @block, notice: "Blocked!"
    else
      flash[:notice] = "Not blocked!"
      render 'new'
    end
  end

  def show
    @block = Block.find(params[:id])
  end

  def block_user
    @user = current_user
    if Block.exists?(:user_id => @user.id, :name => params[:name], :category => params[:category])

      redirect_to blocks_path, notice: "You've already blocked this user!" and return
    end
    @block = Block.new(block_params)
    @block.user = @user
    if @block.save
      if Following.exists?(:user_id => @user.id, :name => params[:name], :category => params[:category])
        @following = Following.find_by(:user_id => @user.id, :name => params[:name], :category => params[:category])
        @following.destroy
      end
      redirect_to @block, notice: "blocked!"
    else
      flash[:notice] = "Not blocked!"
      redirect_to block_path, warn: "You've already blocked this user!"
    end
  end

  def blocked
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    flash[:notice] = "Unblocked!"
    redirect_to blocks_path
  end


  def block_params
    params.permit(:name, :category)
  end
end
