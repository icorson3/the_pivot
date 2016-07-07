class Category < ActiveRecord::Base
  before_save :update_slug
  has_many :items
  has_many :vendors

  validates_format_of :name, :without => /\A\d/
  validates :name, presence: true, uniqueness: true

  enum kind: ["vendor", "item"]

  def update_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end

  def self.find(input)
    if input.to_i == 0
      find_by_name(input)
    else
      super
    end
  end

  def self.item_categories
    self.where(kind: 1)
  end
end
