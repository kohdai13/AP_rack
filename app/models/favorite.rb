class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates_uniqueness_of :shop_id, scope: :user_id

  def self.favorite_method(shop, user)
    Favorite.find_by(shop_id: shop.id, user_id: user.id)
  end
end
