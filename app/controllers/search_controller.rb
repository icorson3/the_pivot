class SearchController < ApplicationController

  def index
    if Item.search(params[:search]).order("name DESC") == []
      flash[:warning] = "Sorry, #{params[:search]} not found."
      redirect_to items_path
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
    else
<<<<<<< HEAD
      @items = items.search(params[:search]).order("name DESC")
      @categories = Category.pluck(:name).uniq
      @vendors = Vendor.pluck(:name).uniq
=======
      @items = Item.all.search(params[:search]).order("name DESC")
>>>>>>> a5a030c8d4ad0e584274c752706bccda7835c943
    end
  end
end
