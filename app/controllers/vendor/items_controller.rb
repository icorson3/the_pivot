class Vendor::ItemsController < ApplicationController
  def index
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @items = @vendor.items
  end

  def show
    @item = Item.find(params[:id])
  end
end
