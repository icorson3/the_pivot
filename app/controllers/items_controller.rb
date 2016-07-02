class ItemsController < ApplicationController
  def index
    @per_page = params[:per_page] || 15
    approved_vendor_items = Item.joins(:vendor).where(vendors: {status: "approved"})
    @items = approved_vendor_items.paginate(:per_page => @per_page, :page => params[:page])
  end
end
