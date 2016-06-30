class Seed
  def initialize
    create_categories
    create_vendors
    create_items
    create_users
    create_orders
    create_business_admins
  end

  def create_items
    puts "Creating Items"
    Item.create!(name: "Apples",
                  description: "Delicous Apples",
                  price: Faker::Number.decimal(2),
                  image: "https://pixabay.com/photo-661694",
                  status: 0,
                  vendor_id: 1,
                  category_id: 1)
    puts "Created Items"
  end

  def create_users
    puts "Creating Users"
    usernames = []
    200.times { usernames << Faker::Internet.user_name }
    usernames = usernames.uniq
    99.times do
      username = usernames.pop
      User.create!(
      username: username,
      password: Faker::Internet.password,
      role: 0,
      email: Faker::Internet.email('username'),
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      vendor_id: nil
      )
    end
    puts "Created Users"
  end

  def create_vendors
    puts "Creating Vendors"
    Vendor.create!(name: "Blue Barn Farms",
                   description: "Specializes in Premium Peaches and Apples",
                   city: Faker::Address.city,
                   state: Faker::Address.state,
                   status: 0,
                   slug: "T & C Ranch".parameterize,
                   category_id: 1)

    Vendor.create!(name: "Abbott Crossing",
                    description: "Specializes in Premium Produce",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Abbott Crossing".parameterize,
                    category_id: 1)

    Vendor.create!(name: "Barker's Brayers",
                     description: "Specializes in Premium Produce",
                     city: Faker::Address.city,
                     state: Faker::Address.state,
                     status: 0,
                     slug: "Barker's Brayers".parameterize,
                     category_id: 1)

    Vendor.create!(name: "Elysium Fields",
                    description: "Specializes in Premium Produce",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Elysium Fields".parameterize,
                    category_id: 1)

    Vendor.create!(name: "Grey'n Achers",
                    description: "Specializes in Premium Livestock",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Grey'n Achers".parameterize,
                    category_id: 2)

    Vendor.create!(name: "Ba Donka Donk Mini Donks",
                    description: "Specializes in Premium Donkeys",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Ba Donka Donk Mini Donks".parameterize,
                    category_id: 2)

    Vendor.create!(name: "Laughing Stock Farm",
                    description: "Specializes in Premium Livestock",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Laughing Stock Farm".parameterize,
                    category_id: 2)

    Vendor.create!(name: "Our Lazy Ass Acres",
                    description: "Specializes in Premium Livestock",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Our Lazy Ass Acres".parameterize,
                    category_id: 2)

    Vendor.create!(name: "Rain Creek Farm",
                    description: "Specializes in Premium Products",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Rain Creek Farm".parameterize,
                    category_id: 3)

    Vendor.create!(name: "Poquito Burrito Ranchito",
                    description: "Specializes in Premium Products",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Poquito Burrito Ranchito".parameterize,
                    category_id: 3)

    Vendor.create!(name: "The Mustard Seed",
                    description: "Specializes in Premium Products",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "The Mustard Seed".parameterize,
                    category_id: 3)

    Vendor.create!(name: "Wise Ass Farm",
                    description: "Specializes in Premium Products",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Wise Ass Farm".parameterize,
                    category_id: 3)

    Vendor.create!(name: "Gailan Farms",
                    description: "Specializes in Premium Art",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Gailan Farms".parameterize,
                    category_id: 4)

    Vendor.create!(name: "Just One More Farm",
                    description: "Specializes in Premium Art",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Just One More Farm".parameterize,
                    category_id: 4)

    Vendor.create!(name: "Hickory Wind",
                    description: "Specializes in Premium Art",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Hickory Wind".parameterize,
                    category_id: 4)

    Vendor.create!(name: "Tinsel Tots Station",
                    description: "Specializes in Premium Art",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Tinsel Tots Station".parameterize,
                    category_id: 4)

    Vendor.create!(name: "Styria Bakery",
                    description: "Specializes in Premium Baked Goods",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Styria Bakery".parameterize,
                    category_id: 5)

    Vendor.create!(name: "Blissful Farm",
                    description: "Specializes in Premium Baked Goods",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Blissful Farm".parameterize,
                    category_id: 5)

    Vendor.create!(name: "Butternut Ridge",
                    description: "Specializes in Premium Baked Goods",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Butternut Ridge".parameterize,
                    category_id: 5)

    Vendor.create!(name: "Mini Donk-a-Donk",
                    description: "Specializes in Premium Baked Goods",
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    status: 0,
                    slug: "Mini Donk-a-Donk".parameterize,
                    category_id: 5)
    20.times do
      name = Faker::Company.name
      Vendor.create!(
      name: name,
      description: Faker::Hipster.paragraph,
      city: Faker::Address.city,
      state: Faker::Address.state,
      status: %w(pending approved rejected retired).sample,
      slug: name.parameterize,
      category_id: rand(1..10)
      )
    end
    puts "Created Vendors"
  end

  def create_categories
    puts "Creating Vendor Categories"
    Category.create!(name: "produce",
    kind: 0)
    Category.create!(name: "livestock",
    kind: 0)
    Category.create!(name: "miscellaneous",
    kind: 0)
    Category.create!(name: "art",
    kind: 0)
    Category.create!(name: "bakery",
    kind: 0)
    puts "Creating Item Categories"
    Category.create!(name: "fruits",
    kind: 1)
    Category.create!(name: "vegetables",
    kind: 1)
    Category.create!(name: "arts & crafts",
    kind: 1)
    Category.create!(name: "meat & dairy",
    kind: 1)
    Category.create!(name: "baked goods",
    kind: 1)
    puts "Created Categories"
  end

  def create_orders
    puts "Creating Orders"
    User.all.each do |user|
      10.times do
        status = [0,1,2,3].sample
        time = Faker::Date.between(2.years.ago, Date.today) if status == 3
        item_ids = (1...500).to_a.sample(10)
        order = Order.create!(
        status: status,
        finished_at: time,
        user_id: user.id
        )
        add_items(order, item_ids)
      end
    end
    puts "Created Orders"
  end

  def create_business_admins
    Vendor.all.each do |vendor|
      username = Faker::Internet.user_name
      User.create!(
      username: username,
      password: Faker::Internet.password,
      role: 1,
      email: Faker::Internet.email('username'),
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      vendor_id: vendor.id
      )
    end
  end

  private

  def add_items(order, items)
    10.times do |i|
      item = Item.find(items.pop)
      order.items << item
      puts "#{i}: Added item #{item.name} to order #{order.id}."
    end
  end
end
Seed.new

User.create!(username: "jmejia@turing.io",
             password: "password",
             role: 0,
             email: "jmejia@turing.io",
             name: "Josh",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: nil)
User.create!(username: "nate@turing.io",
             password: "password",
             role: 1,
             email: "nate@turing.io",
             name: "Nate",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: 1)
User.create!(username: "jorge@turing.io",
             password: "password",
             role: 2,
             email: "jorge@turing.io",
             name: "Jorge",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: nil)
