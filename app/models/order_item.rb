class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  belongs_to :vendor

  def self.vendors_orders_items(vendor)
    self.joins(:item).merge(Item.where(vendor: vendor))
  end

end
