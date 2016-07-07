class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
    @categories = Category.pluck(:name)
    @vendors = Vendor.approved.pluck(:name)
    @items = @category.items.from_approved_vendors
  end
end
