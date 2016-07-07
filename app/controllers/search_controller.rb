class SearchController < ApplicationController

  def index
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
      @categories = Category.pluck(:name)
      @vendors = Vendor.pluck(:name)
    else
      @categories = Category.pluck(:name)
      @vendors = Vendor.pluck(:name)
      @items = Item.active.from_approved_vendors.search(params[:search]).order("name DESC")
    end
  end
end
