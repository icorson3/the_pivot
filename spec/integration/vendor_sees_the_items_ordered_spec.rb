require 'rails_helper'

RSpec.feature "vendor sees items ordered" do
  scenario "vendor sees links to view orders" do
    vendor = create(:vendor_with_items)
    business_admin = create(:user, role: 1, vendor: vendor)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

    visit dashboard_path

    expect(page).to have_link("Your Purchase History")
  end

  scenario "vendor can see each their order index" do
    vendor = create(:vendor, status: "approved")
    vendor_1 = create(:vendor, status: "approved")
    item_1 = create(:item, vendor: vendor_1)
    item = create(:item, vendor: vendor)
    admin = create(:user, role: 1, vendor: vendor)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit vendor_item_path(vendor.slug, item)
    click_on "Add to cart"

    visit vendor_item_path(vendor_1.slug, item_1)
    click_on "Add to cart"

    visit cart_path

    click_on "Checkout"

    expect(Order.count).to eq(1)
    visit dashboard_path

    click_on "Vendor Orders"

    expect(page).to have_content("#{vendor.name}'s Orders")
    expect(current_path).to eq(vendor_orders_path(vendor.slug))
    expect(page).to have_content(vendor.order_items.first.item.name)
    expect(page).to_not have_content(vendor_1.order_items.first.item.name)
  end
end
