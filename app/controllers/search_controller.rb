class SearchController < ApplicationController

  def index
      @per_page = params[:per_page] || 15
      # @items = items
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
    else
      @items = items.search(params[:search]).order("name DESC")
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
    end
  end

  private
    def items
      Item.paginate(:per_page => @per_page, :page => params[:page])
    end
end
