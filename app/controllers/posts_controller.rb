class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post(params[:id])
  end

  def new
    @post = Post.new
    @post.post_images.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: '新しい投稿をしました。'
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '投稿を編集しました。'
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :prefecture, :address, :description, post_images_images: [])
      #:lutitude, :longitude
    end

end
