require "rails_helper"

RSpec.feature "admin login functions" do
  scenario "admin logs in" do
    admin = create(:user, role: 2)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Login"

    expect(current_path).to eq("/admin/dashboard")
    expect(page).to have_content("Welcome #{admin.username}")
  end

  scenario "default user cannot view admin dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)

    visit admin_dashboard_path

    expect(page).not_to have_content("Admin Dashboard")

    expect(page).to have_content("You are not authorized to view this page.")
  end

  scenario "guest cannot view admin dashboard" do
    visit admin_dashboard_path

    expect(current_path).to eq root_path
  end
end
