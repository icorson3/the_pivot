class SearchController < ApplicationController

  def index
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
    else
      @items = Item.all.search(params[:search]).order("name DESC")
    end
  end
end
