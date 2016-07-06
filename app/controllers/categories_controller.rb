class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
    @categories = Category.pluck(:name).uniq
    @vendors = Vendor.pluck(:name).uniq
    @items = @category.items.from_approved_vendors
  end
end
