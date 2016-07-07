class ItemsController < ApplicationController
  def index
    @categories = Category.pluck(:name)
    @vendors = Vendor.pluck(:name)
    @items = Item.from_approved_vendors
  end
end
