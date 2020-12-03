class InteractionsController < ApplicationController
  def index
    @interaction = Interaction.all
  end

  def new
    @interaction = Interaction.new
  end

  def create
    @user = current_user
    @interaction = @user.interactions.new(interaction_params)
  end

  def edit
  end

  def show
    @interaction = Interaction.all
  end

  def view
    @user = User.find(params[:id])
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy
  end

  def interaction_params
    params.permit(:postID, :category)
  end
end
