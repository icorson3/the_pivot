class User < ActiveRecord::Base
  has_many :orders
  belongs_to :vendor

  validates :username, presence: :true, uniqueness: :true
  validates :password, presence: :true, on: :create
  validates :email, presence: :true
  validates :name, presence: :true
  validates :address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zip, presence: :true

  has_secure_password validations: false
  validates_confirmation_of :password, message: "does not match"
  validates_confirmation_of :email, message: "does not match"


  enum role: { default: 0 , business_admin: 1, super_admin: 2 }

  def self.search(search)
    query = "#{search}"
    self.where("username ILIKE ?", query)
  end

  def vendor?
    true if self.vendor
  end

end
