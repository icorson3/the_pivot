require 'rails_helper'

RSpec.feature "Items on the order page link to store item path" do
  scenario "Link goes to the store_item_path" do
    items = create_list(:item, 2)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(order)
    click_on items.first.name
    expect(current_path).to eq(vendor_item_path(items.first.vendor.slug, items.first))
  end

end
