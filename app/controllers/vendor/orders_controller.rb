class Vendor::OrdersController < ApplicationController

  def index
    @vendor = current_user.vendor
    @orders = OrderItem.where(vendor_id: @vendor)
  end

end
