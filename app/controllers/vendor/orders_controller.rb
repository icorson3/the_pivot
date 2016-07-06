class Vendor::OrdersController < ApplicationController

  def index
    @vendor = current_user.vendor
    @order_items = OrderItem.vendors_orders_items(@vendor)
  end

end
