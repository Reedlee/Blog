class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Post.delete(params[:id])
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:header,:body)
  end
end
