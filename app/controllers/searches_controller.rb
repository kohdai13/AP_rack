class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @shops = Shop.where(name: params[:word])
  end
end
