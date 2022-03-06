class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user


  def show
    @user = User.find(params[:id])
    @shops = @user.shop
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "更新が成功しました！"
    else
      render "edit"
    end
  end

  #退会画面を表示するためのアクション
  def withdraw
  end

  def switch
    if @user.update(is_deleted: true)
      sign_out current_user #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end