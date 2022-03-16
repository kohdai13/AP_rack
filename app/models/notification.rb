class Notification < ApplicationRecord
  
  #スコープ(新着順)
    default_scope->{order(created_at: :desc)}

    belongs_to :shop, optional: true
    belongs_to :shop_comment, optional: true
    belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

end
