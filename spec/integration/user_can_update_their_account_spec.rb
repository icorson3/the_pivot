require "rails_helper"

RSpec.feature "User can update account" do
  scenario "user wants to update information" do
    user = create(:user)
    new_user_name = "Bob"

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Login"
    click_link "Update Personal Account Information"
    expect(current_path).to eq("/users/#{user.id}/edit")

    fill_in "Username", with: new_user_name
    fill_in "Password", with: user.password

    click_button "Update Information"
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(new_user_name)
    expect(page).not_to have_content(user.username)
    expect(page).to have_content("#{new_user_name}'s information has been updated.")
  end

  scenario "can't update with bad information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_link "Update Personal Account Information"

    fill_in "City", with: ""

    click_button "Update Information"

    expect(page).to have_content("City can't be blank")
  end
end
