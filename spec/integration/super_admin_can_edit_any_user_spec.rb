require 'rails_helper'

RSpec.feature "super admin can edit users" do
  scenario "super admin can edit user successfully" do
    super_admin = create(:user, role: 2)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit admin_dashboard_path

    expect(page).to have_content("Need to edit a users information?")

    fill_in "Search By Username", with: user.username

    click_on "User Search"

    click_on "Edit User Information"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "Email", with: "poop@example.com"

    click_on "Update Information"

    expect(page).to have_content("#{user.username}'s information has been updated.")
    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario "super admin can edit user unsuccessfully" do
    super_admin = create(:user, role: 2)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(super_admin)

    visit admin_dashboard_path

    expect(page).to have_content("Need to edit a users information?")

    fill_in "Search By Username", with: user.username

    click_on "User Search"

    click_on "Edit User Information"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "Email", with: ""

    click_on "Update Information"

    expect(page).to have_content("Email can't be blank")
    expect(current_path).to eq(user_path(user))
  end
end
