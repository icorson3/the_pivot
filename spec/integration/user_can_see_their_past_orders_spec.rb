require "rails_helper"

RSpec.feature "user views past orders" do
  scenario "they view their orders" do
    user1 = create(:user)
    order1 = user1.orders.create
    order2 = user1.orders.create

    user2 = create(:user)
    order3 = user2.orders.create
    order4 = user2.orders.create

    visit login_path

    fill_in "Username", with: user1.username
    fill_in "Password", with: user1.password
    click_button "Log In"

    visit orders_path

    expect(page).to have_content("#{order1.id} #{order1.created_at}")
    expect(page).to have_content("#{order2.id} #{order2.created_at}")

    expect(page).not_to have_content("#{order3.id} #{order3.created_at}")
    expect(page).not_to have_content("#{order4.id} #{order4.created_at}")
  end

  scenario "they can see which vendor sold which items in order" do
    user = create(:user_with_order)
    order = user.orders.first.id
    order_item = user.orders.first.items.first.name

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Log In"

    visit orders_path

    click_link order

    expect(current_path).to eq order_path(order)
    expect(page).to have_content(order_item)

    click_link order_item

    expect(current_path).to eq vendor_item_path(user.orders.first.items.first.id)
  end
end
