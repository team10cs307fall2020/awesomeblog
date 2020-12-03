class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.commenter = current_user.username
    @user = User.find_by(username: current_user.username)
    @interaction = @user.interactions.create(:postID => @post.id, :category => "Comment")
    if @comment.save
      redirect_to post_path(@post)
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @interaction = Interaction.find_by(postID: @post.id, category: "Comment")
    @interaction.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
