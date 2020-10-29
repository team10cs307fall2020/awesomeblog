class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def new
    @post = Post.new
  end

  def create
    @user = User.find_by(username: current_user.username)
    @post = @user.posts.new(post_params)
    @post.author = @user.username

    if @post.save


      if Topic.exists?(title: @post.topic)
        # No Topic Needed
      else
        topic = Topic.new
        topic.title = @post.topic
        topic.desc = "default"
        topic.save!
        flash[:notice] = topic
      end

      
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

    @topic = Topic.where(:title => @post.topic)
    if Post.where(:topic => @topic[0].title).length == 1
      @topic[0].destroy
    end

    if @post.update(post_params)
      if Topic.exists?(title: @post.topic)
      else
        topic = Topic.new
        topic.title = @post.topic
        topic.desc = "default"
        topic.save!
        flash[:notice] = topic
      end
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:notice] = "Post was not updated"
      render 'edit'
    end
  end


  def destroy
    # Destroy TBD
    #
    #
    #
    #@user = User.find(params[:user_id])
    #@post = @user.posts.find(params[:id]

    @post = Post.find(params[:id])

    @topic = Topic.where(:title => @post.topic)

    @post.destroy

    if Post.where(:topic => @topic[0].title).length == 0
      @topic[0].destroy
    end

    flash[:notice] = "Post was deleted"
    redirect_to posts_path
  end

  private
  def picture=(picture_field)
    transaction do
      if picture_field.size>0 then
        @picture_size=picture_field.size
        @picture_type=picture_field.content_type.chomp
        self.picture_content_type =@picture_type
        self.picture_data = picture_field.read
      end
    end
  end
  def post_params
    params.require(:post).permit(:topic, :title, :text)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
