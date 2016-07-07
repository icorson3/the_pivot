require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "relationships" do
    it { should belong_to(:category) }
    it { should respond_to(:category) }
    it { should have_many(:items) }
    it { should respond_to(:items) }
    it { should have_many(:users) }
    it { should respond_to(:users) }
    it { should have_many(:reviews) }
    it { should have_many(:order_items) }
  end

  context "it creates a slug" do
    scenario "slug" do
      vendor = Vendor.create({
        name: "Country Store",
        description: "sells stuff",
        city: "Denver",
        state: "CO",
        status: "approved"
        })
      expect(vendor.create_slug).to eq("country-store")
    end
  end
end
