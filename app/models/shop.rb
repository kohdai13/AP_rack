class Shop < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :shop_comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :genre, presence: true
  validates :address, presence: true
  validates :brand, presence: true
  validates :description, presence: true,length:{maximum:200}



  def shop_image
    image.attached? ? image : 'no_image.jpg'
  end


  def favorited_by?(user)

    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @shop = Shop.where("name LIKE? OR address like? OR brand like?", "#{word}", "#{word}", "#{word}" )
    elsif search == "partial_match"
      @shop = Shop.where("name LIKE? OR address like? OR brand like?", "%#{word}%", "%#{word}%", "%#{word}%" )
    else
      @shop = Shop.all
    end
  end


  #Google map表示機能
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  #通知機能
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      shop_id: id,
      visited_id: user_id,
      action: "favorite"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, shop_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = ShopComment.select(:user_id).where(shop_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, shop_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, shop_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, shop_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      shop_id: id,
      shop_comment_id: shop_comment_id,
      visited_id: visited_id,
      action: 'shop_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
