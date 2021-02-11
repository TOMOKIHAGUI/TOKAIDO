class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '投稿を編集しました。'
    else
      render "edit"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.find(params[:id])
  end

  def hide
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following_users.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users.all
  end

  def bookmarks
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :comment, :prefecture, :is_deleted)
  end

end
