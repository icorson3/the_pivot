class Seed

  def initialize
    create_categories
    create_items
    create_users
    create_vendors
    create_orders
    create_business_admins
  end

  def create_items
    status = [0,1]
    puts "Creating Items"
    Categories.all.each do |category|
      50.times do
        Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Hipster.sentence,
          price: Faker::Number.decimal(2),
          image: Faker::Avatar.image,
          status: status.sample,
          vendor_id: rand(1..20),
          category_id: category.id
        )
      end
    end
    puts "Created Items"
  end

  def create_users
    puts "Creating Users"
    99.times do
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
      vendor_id: nil
      )
    end
    puts "Created Users"
  end

  def create_vendors
    puts "Creating Vendors"
    name = Faker::Company.name
    20.times do Vendor.create!(
      name: name,
      description: Faker::Hipster.paragraph,
      city: Faker::Address.city,
      state: Faker::Address.state,
      status:[0,1,2,3],
      slug: name.parameterize,
      category_id: rand(1..10)
      )
    end
    puts "Created Vendors"
  end

  def create_categories
    puts "Creating Categories"
    10.times do Category.create!(
      name: Faker::Commerce.department(1),
      kind: [0,1].sample
      )
    end
    puts "Created Categories"
  end

  def create_orders
    puts "Creating Orders"
    User.all.each do |user|
      10.times do
        status = [0,1,2,3].sample
        time = Faker::Date.between(2.years.ago, Date.today) if status == 3
        item_ids = (1...500).to_a.sample(10)
        Order.create!(
        status: status,
        finished_at: time,
        user_id: user.id
        )
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
      role: 2,
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
end

User.create!(username: "jmejia@turing.io",
             password: "password",
             role: 1,
             email: "jmejia@turing.io",
             name: "Josh",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: nil)
User.create!(username: "nate@turing.io",
             password: "password",
             role: 2,
             email: "nate@turing.io",
             name: "Nate",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: 1)
User.create!(username: "jorge@turing.io",
             password: "password",
             role: 3,
             email: "jorge@turing.io",
             name: "Jorge",
             address: Faker::Address.street_address,
             city: Faker::Address.city,
             state: Faker::Address.state,
             zip: Faker::Address.zip_code,
             vendor_id: nil)

Seed.new


# finished_at: status == 3 ? Faker::Date.between(2.years.ago, Date.today) : nil,
