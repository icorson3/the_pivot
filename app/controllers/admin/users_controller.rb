class Admin::UsersController < Admin::BaseController
  def show
    @user = current_user
    @edit_users = User.search(params[:search])
    @orders = Order.all
    @vendors = Vendor.status("pending")
  end
end
