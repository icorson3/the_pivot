require "rails_helper"

RSpec.feature "Visitor can see all items for a vendor", :type => :feature do
  scenario "visitor visits the vendor items page" do
    vendor_1 = create(:vendor_with_items)
    vendor_2 = create(:vendor_with_items)

    items_1 = vendor_1.items
    items_2 = vendor_2.items

    visit vendor_items_path(vendor_1.slug)

    expect(page).to have_content(items_1[0].name)
    expect(page).to have_content(items_1[1].name)

    visit vendor_items_path(vendor_2.slug)

    expect(page).to have_content(items_2[0].name)
    expect(page).to have_content(items_2[1].name)
  end
end
