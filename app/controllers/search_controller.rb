class SearchController < ApplicationController

  def index
      @per_page = params[:per_page] || 15
      # @items = items
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
    else
      @items = items.search(params[:search]).order("name DESC")
    end
  end

  private
    def items
      Item.paginate(:per_page => @per_page, :page => params[:page])
    end
end
