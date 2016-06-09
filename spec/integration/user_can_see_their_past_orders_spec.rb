require 'rails_helper'

RSpec.feature "user views past orders" do
  scenario "they view their orders" do

    user1 = create(:user)
    order1 = user1.orders.create
    order2 = user1.orders.create

    user2 = create(:user)
    order3 = user2.orders.create
    order4 = user2.orders.create

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit login_path

    fill_in "Username", with: user1.username
    fill_in "Password", with: user1.password
    click_button "Log In"

    visit orders_path

    expect(page).to have_content("Order ##{order1.id}")
    expect(page).to have_content("Order ##{order2.id}")

    expect(page).not_to have_content("Order ##{order3.id}")
    expect(page).not_to have_content("Order ##{order4.id}")
  end
end
