class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  belongs_to :vendor
end
