class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shop_comments, dependent: :destroy

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  has_one_attached :profile_image

  validates :name, presence: true
  validates :nickname, presence: true
  validates :introduction, presence: true


  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
