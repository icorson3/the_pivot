require 'rails_helper'

RSpec.feature "super admin can add change items for any vendor" do
  scenario "they can add an item" do
    super_admin = create(:user, role: 2)
    vendor = create(:vendor)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit vendor_show_path(vendor.slug)

    click_on "Add Item to Store"

    fill_in "Name", with: "Cherries"
    fill_in "Description", with: "The best ever!"
    fill_in "Price", with: 19.99
    fill_in "Image", with: "http://www.cultivaipm.com/wp-content/uploads/2013/10/cherries.jpg"
    select category.name, from: "item[category_id]"

    click_on "Create Item"

    expect(current_path).to eq(vendor_item_path(vendor.slug, Item.first))
    expect(page).to have_content "Cherries"
    expect(page).to have_content "The best ever!"
    expect(page).to have_content "$19.99"
    expect(page).to have_content vendor.name
  end

  scenario "they can edit an item" do
    super_admin = create(:user, role: 2)
    vendor = create(:vendor_with_items)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit vendor_item_path(vendor.slug, vendor.items[0])

    click_on "Edit Item"

    fill_in "Name", with: "Cherries"
    fill_in "Description", with: "The best ever!"
    fill_in "Price", with: 19.99
    fill_in "Image", with: "http://www.cultivaipm.com/wp-content/uploads/2013/10/cherries.jpg"
    select category.name, from: "item[category_id]"

    click_on "Update Item"

    expect(page).to have_content "Cherries"
    expect(page).to have_content "The best ever!"
    expect(page).to have_content "$19.99"
    expect(page).to have_content vendor.name
  end

  scenario "they can remove an item" do
    super_admin = create(:user, role: 2)
    vendor = create(:vendor_with_items)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit vendor_item_path(vendor.slug, vendor.items[0])

    click_on "Remove Item"

    expect(current_path).to eq(vendor_items_path(vendor.slug))
    expect(page).to_not have_content vendor.items[0].name
  end
end
