class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_constants
  before_action :set_cart
  before_action :authorize!
  helper_method :current_user, :current_super_admin?

  def set_constants
    @categories = Category.all
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_super_admin?
    current_user && current_user.super_admin?
  end

  def get_favicon
    send_file Rails.root.join("app", "assets", "images", "favicon.ico"), type: "image/gif", disposition: "inline"
  end

  private

  def authorize!
    unless authorized?
      redirect_to root_url
      flash[:warning] = "You are not authorized to view this page."
    end
  end

  def authorized?
    current_permission ||= PermissionsService.new(current_user, params[:controller], params[:action])
    current_permission.allow?
  end
end
