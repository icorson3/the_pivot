class ItemsController < ApplicationController
  def index
<<<<<<< HEAD
    @per_page = params[:per_page] || 15
    @items = Item.from_approved_vendors.paginate(:per_page => @per_page, :page => params[:page])
    @categories = Category.pluck(:name).uniq
    @vendors = Vendor.pluck(:name).uniq
=======
    @items = Item.from_approved_vendors
>>>>>>> a5a030c8d4ad0e584274c752706bccda7835c943
  end
end
