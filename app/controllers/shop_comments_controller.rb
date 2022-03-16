class ShopCommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    @comment = current_user.shop_comments.new(shop_comment_params)
    @comment.shop_id = @shop.id
    if @comment.save
      #通知の作成
      @shop.create_notification_comment!(current_user, @comment.id)
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    ShopComment.find(params[:id]).destroy
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end

end
