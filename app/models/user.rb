class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  
  has_one_attached :profile_image
  
  
  
  validates :name, presence: true
  validates :nickname, presence: true
  validates :gender, presence: true
  validates :introduction, presence: true
  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
