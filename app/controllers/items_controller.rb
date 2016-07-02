class ItemsController < ApplicationController
  def index
    @per_page = params[:per_page] || Item.per_page || 15
    @items = Item.paginate(:per_page => @per_page, :page => params[:page])
  end
end
