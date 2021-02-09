class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.build(post_comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :comment
    else
      @user = @book.user
      render 'books/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.find(params[:id])
    comment.destroy
    render :comment
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :post_id)
  end

end
