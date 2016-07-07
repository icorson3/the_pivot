class ItemsController < ApplicationController
  def index
    @categories = Category.pluck(:name)
    @vendors = Vendor.approved.pluck(:name)
    @items = Item.active.from_approved_vendors
  end
end
