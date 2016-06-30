require 'rails_helper'

RSpec.feature "user searches for an item using search bar", type: :feature do
  scenario "user searches for an item using search bar" do
    vendors = create_list(:vendor_with_items, 3)

    visit root_path

    fill_in "Search", with: vendors[0].items.first.name
    click_button "Search"
    expect(page).to have_no_content("Sorry, #{vendors[0].items.first.name} not found.")
    expect(page.text).to have_content("#{vendors[0].items.first.name}")

    expect(current_path).to eq("/search")

    click_on "#{vendors[0].items.first.name}"
    expect(current_path).to eq(vendor_item_path(vendors[0].slug, vendors[0].items.first))
    expect(page.text).to have_content("#{vendors[0].items.first.name}")

    expect(page.text).to have_content("#{vendors[0].items.first.name}")
  end
end
