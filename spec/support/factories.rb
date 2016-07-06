FactoryGirl.define do
  factory :user do
    username
    password "password"
    password_confirmation "password"
    email "email@test.com"
    name "John Doe"
    address "1234 Fake Street"
    city  "Faketown"
    state "FT"
    zip "1234"
    role "default"

    factory :user_with_order do
      orders { create_list(:order_with_items, 3) }
    end
  end

  factory :item do
    name
    description "test description"
    price "5.99"
    image "http://i.imgur.com/kgOqHMk.gif"
    status 0
    vendor
    category
  end

  factory :category do
    name
    kind 1
  end

  factory :order do
    user
    status 0

    factory :order_with_items do
      items { create_list(:item, 3) }
    end

    # factory :order_for_vendor do
    #   vendor { create(:vendor) }
    #   item { create(:item, vendor: vendor) }
    # end
  end

  factory :vendor do
    name {Faker::Name.name}
    description "all the things"
    city "denver"
    state "CO"
    status "approved"

    factory :vendor_with_items do
      items { create_list(:item, 3) }
    end
  end

  sequence :username do |n|
    "User #{n}"
  end

  sequence :name do |n|
    "item_#{n}"
  end
end
