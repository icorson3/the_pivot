require 'rails_helper'

RSpec.feature "business admin controls other business admins" do
 scenario "user applies to be business admin" do
   user = create(:user)
   user_1 = create(:user)
   business_admin = create(:user, role: 1)

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

   visit dashboard_path
   fill_in "Search By Username", with: user.username

   click_on "User Search"

   expect(page).to have_content(user.username)
   expect(page).to have_no_content(user_1.username)
 end

 scenario "business admin can change role of user" do
   user = create(:user)
   vendor = create(:vendor)
   business_admin = create(:user, role: 1, vendor: vendor)

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

   visit dashboard_path
   fill_in "Search By Username", with: user.username

   click_on "User Search"

   click_on "Add Admin"

   user_updated = User.first

   expect(current_path).to eq(dashboard_path)
   expect(user_updated.vendor.id).to eq(business_admin.vendor.id)
   expect(user_updated.role).to eq("business_admin")
 end
end
