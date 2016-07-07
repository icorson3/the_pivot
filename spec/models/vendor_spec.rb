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
    scenario "manually create slug" do
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

  context "it finds approved vendors" do
    scenario "approved returns approved vendors" do
      vendor = Vendor.create({
        name: "Country Store",
        description: "sells stuff",
        city: "Denver",
        state: "CO",
        status: "approved"
        })
      expect(Vendor.approved).to eq([vendor])
    end
  end

  context "it finds rejected vendors" do
    scenario "approved returns rejected vendors" do
      vendor = Vendor.create({
        name: "Country Store",
        description: "sells stuff",
        city: "Denver",
        state: "CO",
        status: "rejected"
        })
      expect(Vendor.rejected).to eq([vendor])
    end
  end

  context "it finds pending vendors" do
    scenario "approved returns pending vendors" do
      vendor = Vendor.create({
        name: "Country Store",
        description: "sells stuff",
        city: "Denver",
        state: "CO",
        status: "pending"
        })
      expect(Vendor.pending).to eq([vendor])
    end
  end

  context "it finds retired vendors" do
    scenario "approved returns retired vendors" do
      vendor = Vendor.create({
        name: "Country Store",
        description: "sells stuff",
        city: "Denver",
        state: "CO",
        status: "retired"
        })
      expect(Vendor.retired).to eq([vendor])
    end
  end
end
