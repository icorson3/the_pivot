require 'rails_helper'

RSpec.feature "any user sees all vendors" do
  scenario "all vendors are seen" do
    vendor = create(:vendor)

    visit vendors_path

    expect(page).to have_content(vendor.name)
    expect(page).to have_link(vendor.name)
  end
end
