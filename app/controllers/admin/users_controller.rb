class Admin::UsersController < Admin::BaseController
  def show
    @user = current_user
    @orders = Order.all
    @vendors = Vendor.where(status: "pending")
  end
end
