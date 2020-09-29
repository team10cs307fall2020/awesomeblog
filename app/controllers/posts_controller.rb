class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:notice] = "Post was not updated"
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:topic, :title, :text)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
