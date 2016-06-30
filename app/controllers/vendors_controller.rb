class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find_by(slug: params[:vendor_slug])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      current_user.vendor = @vendor
      flash[:welcome] = "Thanks for applying to be a vendor!"
      redirect_to dashboard_path
    else
      flash.now[:error] = @vendor.errors.full_messages[0]
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = @vendor.errors.full_messages[0]
      render :edit
    end
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :description, :city, :state)
    end
end
