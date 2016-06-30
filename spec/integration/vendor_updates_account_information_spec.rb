require 'rails_helper'

RSpec.feature "vendor updates information" do
  scenario "vendor can edit their own information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Apply to be a Vendor"

    fill_in "Name", with: "Farmer Bob"
    fill_in "Description", with: "fruits"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"

    click_on "Apply Now!"

    click_on "Edit Vendor Information"

    expect(current_path).to eq(edit_vendor_path(user.vendor))

    within("h1") do
      expect(page).to have_content("Edit Vendor Information")
    end

    fill_in "Description", with: "fruits and vegetables"

    click_on "Update"

    expect(current_path).to eq(dashboard_path)
  end
end