require 'rails_helper'

RSpec.feature "vendor sees items ordered" do
  scenario "vendor sees links to items ordered" do
    vendor = create(:vendor_with_items)
    business_admin = create(:user, role: 1, vendor: vendor)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

    visit dashboard_path

    expect(page).to have_link("See Orders")
  end

  scenario "vendor can see each their order index" do
    items = create_list(:item, 2)
    vendor = create(:vendor, status: "approved")
    admin = create(:user, role: 1, vendor: vendor)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    click_on "See Orders"

    expect(page).to have_content("#{vendor.name}'s Orders")
  end
end
