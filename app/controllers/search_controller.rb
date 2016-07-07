class SearchController < ApplicationController

  def index
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
      @categories = Category.pluck(:name)
      @vendors = Vendor.status("approved").pluck(:name)
    else
      @categories = Category.pluck(:name)
      @vendors = Vendor.status("approved").pluck(:name)
      @items = Item.all.search(params[:search]).order("name DESC")
    end
  end
end
