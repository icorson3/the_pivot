class Vendor < ActiveRecord::Base
  has_many :items
  before_create :create_slug

  def create_slug
    self.slug = name.parameterize
  end
end
