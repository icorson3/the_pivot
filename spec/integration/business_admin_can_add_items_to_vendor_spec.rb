require 'rails_helper'

RSpec.xfeature "business admin can manage items in their store" do
  scenario "they add an item and see it in the store" do
    user = create(:user)
    vendor = create(:vendor)
    user.update(role: 1, vendor: vendor)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Add Item to My Store"

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

  scenario "they can edit an item in their store" do
    user = create(:user)
    item = create(:item)
    user.update(role: 1, vendor: item.vendor)
    category = create(:category)

    visit vendor_item_path(item.vendor.slug, item)

    expect(page).to_not have_content "Edit Item"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit vendor_item_path(item.vendor.slug, item)

    click_on "Edit Item"

    fill_in "Name", with: "Cherries"
    fill_in "Description", with: "The best ever!"
    fill_in "Price", with: 19.99
    fill_in "Image", with: "http://www.cultivaipm.com/wp-content/uploads/2013/10/cherries.jpg"
    select category.name, from: "item[category_id]"

    click_on "Edit Item"

    expect(page).to have_content "Cherries"
    expect(page).to have_content "The best ever!"
    expect(page).to have_content "$19.99"
    expect(page).to have_content item.vendor.name
  end
end
