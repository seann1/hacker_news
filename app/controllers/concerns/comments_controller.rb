class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @post = Post.find(params[:post_id])
    @comments_for_post = Comment.where(:post_id => params[:post_id])
    @comment = Comment.new
    fsdf
    render 'index'
  end

  def new
    @comment = Comment.new
    render 'new"'
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      flash[:notice] = "Comment added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update

  end

  def edit

  end

  def show
    @comments = Comment.all
    @post = Post.find(params[:post_id])
    @comments_for_post = Comment.where(:post_id => params[:post_id])
    render 'show'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "comment deleted"
    redirect_to show_comments_path
  end
end

