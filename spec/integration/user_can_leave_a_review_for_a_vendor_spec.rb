require "rails_helper"

RSpec.feature "user can leave a review for a vendor" do
  scenario "user can leave feedback for vendor" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    vendor = create(:vendor)

    visit vendor_show_path(vendor.slug)

    fill_in "Body", with: "Great seller!"

    click_on "Submit"

    expect(page).to have_content("Reviews(1)")
    within(".review-post") do
      expect(page).to have_content("Great seller!")
      expect(page).to have_content(user.username)
    end
  end
  scenario "visitor cannot leave feedback for vendor" do
    vendor = create(:vendor)

    visit vendor_show_path(vendor.slug)

    expect(page).to_not have_content("Author")
    expect(page).to_not have_content("Body")
    expect(page).to_not have_content("Submit")
  end
end
