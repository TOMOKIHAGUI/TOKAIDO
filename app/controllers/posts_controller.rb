class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).reverse_order
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comment = PostComment.new
    @vote = Vote.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
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
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
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

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.page(params[:page]).reverse_order    #クリックしたタグに紐付けられた投稿を全て表示
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :prefecture, :address, :description, :image)
      #:lutitude, :longitude
    end

end
