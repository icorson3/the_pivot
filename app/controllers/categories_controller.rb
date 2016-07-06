class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
    @items = @category.items.from_approved_vendors
  end
end
