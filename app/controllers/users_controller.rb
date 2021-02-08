class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def mypage
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash.now[:notice] = "登録情報が編集されました"
      redirect_to mypage_user_path(@user.id)
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

  private

  def user_params
    params.require(:user).permit(:name, :image, :comment, :prefecture, :is_deleted)
  end

end
