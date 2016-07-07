class Vendor < ActiveRecord::Base
  has_many :items
  belongs_to :category
  has_many :users
  has_many :reviews
  has_many :order_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true

  before_create :create_slug
  scope :approved, -> { where(status: "approved") }
  scope :rejected, -> { where(status: "rejected") }
  scope :retired, -> { where(status: "retired") }
  scope :pending, -> { where(status: "pending") }

  def create_slug
    self.slug = name.parameterize
  end

  def self.status(status)
    Vendor.where(status: status)
  end

end
