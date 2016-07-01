class Vendor < ActiveRecord::Base
  has_many :items
  belongs_to :category
  has_many :users

  before_create :create_slug

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def create_slug
    self.slug = name.parameterize
  end
end
