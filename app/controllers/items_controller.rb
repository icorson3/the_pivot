class ItemsController < ApplicationController
  def index
    @categories = Category.pluck(:name).uniq
    @vendors = Vendor.pluck(:name).uniq
    @items = Item.from_approved_vendors
  end
end
