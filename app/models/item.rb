class Item < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category

  has_many :order_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  enum status: ["active", "retired"]

  def quantity(order)
    order_item = self.order_items.find_by(order: order)
    order_item.quantity
  end

  def subtotal(order)
    order_item = self.order_items.find_by(order: order)
    order_item.subtotal
  end

  def self.search(search)
    query = "%#{search}%"
    self.where("name ILIKE ? or description ILIKE ?", query, query)
  end

  def self.from_approved_vendors
    self.joins(:vendor).where(vendors: {status: "approved"})
  end

end
