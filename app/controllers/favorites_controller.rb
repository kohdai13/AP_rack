class FavoritesController < ApplicationController

  def index
    @shops = Shop.all.page(params[:page]).per(8)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.new(shop_id: @shop.id)
    favorite.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.find_by(shop_id: @shop.id)
    favorite.destroy
  end
end
