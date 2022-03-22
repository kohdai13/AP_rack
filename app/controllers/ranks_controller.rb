class RanksController < ApplicationController
  def index
    # 投稿のお気に入り数ランキング 10位まで表示
    @shop_favorite_ranks = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(10).pluck(:shop_id))
  end
end
