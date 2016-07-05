require 'rails_helper'

RSpec.feature "user searches for an item using search bar", type: :feature do
  scenario "user searches for an item using search bar" do
    vendors = create_list(:vendor_with_items, 3)
    vendor = vendors.first
    item = vendors.first.items.first

    visit root_path

    fill_in "Search Items", with: vendor.items.first.name
    click_button "Search"

    expect(page).to have_no_content("Sorry, #{vendor.items.first.name} not found.")
    expect(page.text).to have_content(vendor.items.first.name)

    expect(current_path).to eq("/search")
    find(".item_click").click

    expect(current_path).to eq(vendor_item_path(vendor.slug, vendor.items.first))
    expect(page.text).to have_content(vendor.items.first.name)
    expect(page).to have_content(vendor.name)
  end

  scenario "user searches for item that doesnt exist" do

    visit root_path

    fill_in "Search Items", with: "Ilana"

    click_button "Search"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Sorry, Ilana not found.")
  end
end
