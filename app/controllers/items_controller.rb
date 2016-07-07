class ItemsController < ApplicationController
  def index
    @categories = Category.pluck(:name)
    @vendors = Vendor.status("approved").pluck(:name)
    @items = Item.from_approved_vendors
  end
end
