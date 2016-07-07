class Item < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  enum status: ["active", "retired"]

  scope :active, -> { where(status: "active") }
  scope :from_approved_vendors, -> { joins(:vendor).merge(Vendor.approved) }
  scope :search, ->(query) { where("items.name ILIKE ? or items.description ILIKE ?", "%#{query}%", "%#{query}%") }

  def quantity(order)
    order_item = self.order_items.find_by(order: order)
    order_item.quantity
  end

  def subtotal(order)
    order_item = self.order_items.find_by(order: order)
    order_item.subtotal
  end

end
