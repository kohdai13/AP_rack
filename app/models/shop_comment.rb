class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :comment, presence: true,length:{maximum:200}

end
