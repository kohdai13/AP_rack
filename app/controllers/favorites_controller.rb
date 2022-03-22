class FavoritesController < ApplicationController

  def index
    @shops = Shop.page(params[:page]).per(8)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.new(shop_id: @shop.id)
    favorite.save
    @shop.create_notification_by(current_user)
    #通知の作成
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.find_by(shop_id: @shop.id)
    favorite.destroy
  end
end
