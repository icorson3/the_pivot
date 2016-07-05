require 'rails_helper'

RSpec.feature "user applies to be a vendor" do
  scenario "user sees application for vendor" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Apply to be a Vendor"

    expect(current_path).to eq(new_vendor_path)

    within("h1") do
      expect(page).to have_content("Apply to be a vendor!")
    end
  end

  scenario "user fills out application for approval" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Apply to be a Vendor"

    fill_in "Name", with: "Farmer Bob"
    fill_in "Description", with: "fruits"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"

    click_on "Apply Now!"

    expect(current_path).to eq(dashboard_path)
  end

  scenario "user applies but forgets to put in some info" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Apply to be a Vendor"

    fill_in "Name", with: "Farmer Bob"
    fill_in "Description", with: ""
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"

    click_on "Apply Now!"

    expect(current_path).to eq(vendors_path)
    expect(page).to have_content("Description can't be blank")
  end
end
