require "rails_helper"

RSpec.feature "user can leave a review for a vendor" do
  scenario "user can leave feedback for vendor" do
    user = create(:user)
    vendor = create(:vendor)

    visit vendor_show_path(vendor.slug)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    fill_in "Author name", with: user.username
    fill_in "review_body", with: "Great seller!"

    click_on "Submit"

    expect(page).to have_content("Reviews(1)")
    within(".review-post") do
      expect(page).to have_content("Great seller!")
      expect(page).to have_content(user.username)
    end
  end
end
