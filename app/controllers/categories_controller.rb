class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @per_page = params[:per_page] || 15
    @category = Category.find_by(slug: params[:id])
    @items = @category.items.from_approved_vendors.paginate(:per_page => @per_page, :page => params[:page])
  end
end
