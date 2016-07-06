class SearchController < ApplicationController

  def index
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
    else
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
      @items = Item.all.search(params[:search]).order("name DESC")
    end
  end
end
