class PostsController < ApplicationController
  def index
    @posts_before_points_calc = Post.all
    @posts_before_points_calc.each do |i|
      i.points_to_votes
    end
    @posts = @posts_before_points_calc.all.sort_by {|x| x.points}.reverse
    render 'index'
  end

  def new
    @post = Post.new
    render 'new'
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      flash[:notice] = "This post has been added"
      @post.initial_points
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    render 'show'
  end

  def edit
    @post = Post.find(params[:id])
    render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "Your post has been updated"
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "This post has been deleted"
    redirect_to root_path
  end

  def add_point
    @post = Post.find(params[:id])
    @post.one_point
    flash[:notice] = "Plus one point"
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:url, :comment, :points, :user_id)
    end

end
