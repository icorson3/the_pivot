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
    else
      registered_user_permissions
    end
  end

  private

  def super_admin_permissions
    # return true if controller == "orders" && action.in?(["index"])
    true
  end

  def business_admin_permissions
    true
  end

  def registered_user_permissions
    true
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
