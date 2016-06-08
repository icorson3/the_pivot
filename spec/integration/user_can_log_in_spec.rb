require 'rails_helper'

RSpec.feature "user can log in and log out" do
  # context "with valid params" do
    scenario "they see the link to log in " do
      user = create(:user)

      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Log In"

      # within("navbar") do
        # expect(page).to have_content("Logged in as #{user.username}")
        expect(page).to have_content("Log Out")
        expect(page).not_to have_content("Log In")
      # end

      # within("some html") do
      #   #user sees their page content
      # end
    end

    scenario "they see the button to log out" do
      user = create(:user)
      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Log In"

      click_link "Log Out"

      expect(current_path).to eq login_path
      expect(page).to have_content("Log In")
      expect(page).not_to have_content("Log Out")
    end

  # end
end
