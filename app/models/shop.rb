class Shop < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :shop_comments, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :brand, presence: true



  def shop_image
    image.attached? ? image : 'no_image.jpg'
  end


  def favorited_by?(user)

    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    @shop = Shop.all
  end

  #Google map表示機能
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
