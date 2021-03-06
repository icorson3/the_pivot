class Vendor::ItemsController < ApplicationController
  def index
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @categories = Category.pluck(:name)
    @vendors = Vendor.approved.pluck(:name)
    @items = @vendor.items.active
  end

  def show
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @item = Item.find(params[:id])
    @user = current_user || User.new
  end

  def new
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @categories = Category.item_categories
    @item = Item.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_slug])
    @item = @vendor.items.new(vendor_item_params)
    if @item.save
      flash[:success] = "Created new item #{@item.name}!"
      redirect_to vendor_item_path(@vendor.slug, @item)
    else
      flash.now[:error] = @item.errors.full_messages[0]
      render :new
    end
  end

  def edit
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(vendor_item_params)
      flash[:success] = "Created new item #{@item.name}!"
      redirect_to vendor_item_path(@item.vendor.slug, @item)
    else
      flash.now[:error] = @item.errors.full_messages[0]
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:success] = "Removed item!"
      redirect_to vendor_items_path(params[:vendor_slug])
    else
      flash[:error] = "Unable to remove item."
      redirect_to vendor_item_path(params[:vendor_slug], @item)
    end
  end

  private

  def vendor_item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :price,
                                 :image,
                                 :category_id)
  end
end
