class AddCategoryToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :category, index: true, foreign_key: true
  end
end
