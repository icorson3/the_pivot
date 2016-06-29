class Vendor::ItemsController < ApplicationController
  def index
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @items = @vendor.items
  end

  def show
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
  end
end
