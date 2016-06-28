class Item < ActiveRecord::Base
  belongs_to :vendor

  has_many :categories_items
  has_many :categories, through: :categories_items
  has_many :order_items  

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  enum status: ["active", "retired"]

  def quantity(order_id)
    order_item = self.order_items.find_by(order_id: order_id)
    order_item.quantity
  end

  def subtotal(order_id)
    order_item = self.order_items.find_by(order_id: order_id)
    order_item.subtotal
  end
end
