require "rails_helper"

RSpec.feature "admin visits personal dashboard to edit account data" do
  scenario "check if edit page has only admin user data" do
    user = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(current_path).to eq(admin_dashboard_path)

    click_on "Update Personal Account Information"

    expect(current_path).to eq(admin_edit_user_path)
    expect(page).to have_selector("input#user_username", count: 1)
    expect(page).to have_selector("input#user_password", count: 1)
  end
end
