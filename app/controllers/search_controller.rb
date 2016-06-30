class SearchController < ApplicationController

  def index
    @items = Item.all
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
    else
      @items = Item.search(params[:search]).order("name DESC")
    end
  end

end
