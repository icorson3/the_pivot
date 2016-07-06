class ItemsController < ApplicationController
  def index
    @items = Item.from_approved_vendors
  end
end
