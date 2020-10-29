class TopicsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index

    @topics = Topic.order(sort_column + ' ' + sort_direction)
    #@topics = Topic.all
  end

  def sort_column
    Topic.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end


  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @post = Post.where(:topic => @topic.title)
    for i in 0..Post.where(:topic => @topic.title).length - 1
      @post[i].destroy
    end
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :desc)
  end


end
