require 'rails_helper'

RSpec.feature "business admin controls other business admins" do
 scenario "user applies to be business admin" do
   user = create(:user)
   business_admin = create(:user, role: 1)

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)

   visit dashboard_path
   fill_in "Search By Username", with: user.username

   click_on "User Search"

   expect(page).to have_content(user.username)

 end

 scenario "business admin can change role of user" do
   user = create(:user)
   business_admin = create(:user, role: 1)

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(business_admin)
   
 end
end
