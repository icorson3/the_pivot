class Vendor < ActiveRecord::Base
  has_many :items
  belongs_to :category
  has_many :users

  before_create :create_slug

  def create_slug
    self.slug = name.parameterize
  end
end
