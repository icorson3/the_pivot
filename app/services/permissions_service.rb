class PermissionsService

  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def allow?
    if user.super_admin?
      super_admin_permissions
    elsif user.business_admin?
      business_admin_permissions
    elsif user.username.presence
      registered_user_permissions
    else
      unregistered_user_permissions
    end
  end

  private

  def super_admin_permissions
    true
  end

  def business_admin_permissions
    return true if controller == "root" && action.in?(["show"])
    return true if controller == "items" && action.in?(["index"])
    return true if controller == "cart_items" && action.in?(["index", "create", "update", "destroy"])
    return true if controller == "orders" && action.in?(["index", "show", "create"])
    return true if controller == "vendors" && action.in?(["index", "show", "edit", "update"])
    return true if controller == "categories" && action.in?(["index", "show"])
    return true if controller == "vendor/items" && action.in?(["index", "show"])
    return true if controller == "sessions" && action.in?(["new", "create", "destroy"])
    return true if controller == "search" && action.in?(["index"])
    return true if controller == "users" && action.in?(["show", "edit", "update"])
    return true if controller == "application" && action.in?(["get_favicon"])
    return true if controller == "retired/vendors" && action.in?(["index"])
  end

  def registered_user_permissions
    return true if controller == "root" && action.in?(["show"])
    return true if controller == "items" && action.in?(["index"])
    return true if controller == "cart_items" && action.in?(["index", "create", "update", "destroy"])
    return true if controller == "orders" && action.in?(["index", "show", "create"])
    return true if controller == "vendors" && action.in?(["index", "show", "new", "create"])
    return true if controller == "categories" && action.in?(["index", "show"])
    return true if controller == "vendor/items" && action.in?(["index", "show"])
    return true if controller == "sessions" && action.in?(["new", "create", "destroy"])
    return true if controller == "search" && action.in?(["index"])
    return true if controller == "users" && action.in?(["show", "edit", "update"])
    return true if controller == "application" && action.in?(["get_favicon"])
    return true if controller == "retired/vendors" && action.in?(["index"])
  end

  def unregistered_user_permissions
    return true if controller == "root" && action.in?(["show"])
    return true if controller == "items" && action.in?(["index", "show"])
    return true if controller == "users" && action.in?(["new", "create"])
    return true if controller == "vendors" && action.in?(["index", "show"])
    return true if controller == "categories" && action.in?(["index", "show"])
    return true if controller == "vendor/items" && action.in?(["index", "show"])
    return true if controller == "sessions" && action.in?(["new", "create", "destroy"])
    return true if controller == "search" && action.in?(["index"])
    return true if controller == "cart_items" && action.in?(["index", "create", "update", "destroy"])
    return true if controller == "application" && action.in?(["get_favicon"])
    return true if controller == "retired/vendors" && action.in?(["index"])
  end

  def controller
    @controller
  end

  def action
    @action
  end

  def user
    @user
  end
end
