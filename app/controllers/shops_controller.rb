class ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shops = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @user.save
      redirect_to user_path(@user), notice: "投稿が成功しました！"
    else
      render 'new'
    end
  end

  def index
    #ページネーションをつけたいデータに.page(params[:page])を追加 per(10)⇨1ページあたり表示したい数
    @shops = current_user.shops.order(updated_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
    @shop_comment = ShopComment.new
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user ==current_user
      render "edit"
    else
      redirect_to shops_path
    end
  end

  def updeate
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: "更新が成功しました！"
    else
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end


  private

  def shop_params
    params.require(:shop).permit(:name, :address, :genre, :brand, :rate, :description, :latitude, :longitude)
  end
end
