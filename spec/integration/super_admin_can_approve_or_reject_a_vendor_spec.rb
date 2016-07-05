require 'rails_helper'

RSpec.feature "Admin can approve or reject vendors" do
  scenario "valid vendor is proposed to admin, he approves" do
    vendor = create(:vendor, status: "pending")
    super_admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit dashboard_path
    click_on vendor.name
    click_on "Approve"

    expect(current_path).to eq(vendor_show_path(vendor.slug))
    expect(Vendor.first.status).to eq("approved")
    within(".approval") do
      expect(page).to_not have_content("Approve")
    end
  end

  scenario "valid vendor is proposed to admin, he declines" do
    vendor = create(:vendor, status: "pending")
    super_admin = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit dashboard_path
    click_on vendor.name
    click_on "Reject"

    expect(current_path).to eq(vendor_show_path(vendor.slug))
    expect(Vendor.first.status).to eq("rejected")
    within(".approval") do
      expect(page).to_not have_content("Reject")
    end
  end
end
