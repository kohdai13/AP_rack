class RanksController < ApplicationController
  def index
    # 投稿のお気に入り数ランキング
    @shop_favorite_ranks = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').pluck(:shop_id))
  end
end
