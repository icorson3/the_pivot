class ItemsController < ApplicationController
  def index
    @per_page = params[:per_page] || 15
    @items = Item.from_approved_vendors.paginate(:per_page => @per_page, :page => params[:page])
    @categories = Category.pluck(:name).uniq
    @vendors = Vendor.pluck(:name).uniq
  end
end
