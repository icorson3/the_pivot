class Retired::VendorsController < ApplicationController

  def index
    @vendors = Vendor.where(status: "rejected")
  end

end
