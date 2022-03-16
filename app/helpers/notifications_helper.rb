module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_shop = link_to 'あなたの投稿', shop_path(notification), style:"font-weight: bold;"
    @visiter_comment = notification.shop_comment_id
    #notification.actionがかfavoriteかcommentか
    case notification.action
      when "favorite" then
        tag.a(notification.visiter.nickname, href:user_path(@visiter), style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:shop_path(notification.shop_id), style:"font-weight: bold;")+"をお気に入り登録しました"
      when "shop_comment" then
        @comment = ShopComment.find_by(id: notification.shop_comment_id)&.comment
        tag.a(@visiter.nickname, href:user_path(@visiter), style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:shop_path(notification.shop_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
