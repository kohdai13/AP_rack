class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @shops = Shop.looks(params[:search], params[:word])
  end
end
