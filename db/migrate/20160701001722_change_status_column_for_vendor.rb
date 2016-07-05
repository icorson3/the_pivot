class ChangeStatusColumnForVendor < ActiveRecord::Migration
  def change
    change_column_default :vendors, :status, "pending"
  end
end
