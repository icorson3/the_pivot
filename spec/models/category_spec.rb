require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should respond_to(:items) }
  end

  context "relationships" do
    it { should have_many(:items) }
    it { should have_many(:vendors) }
  end

  it "does not save to db without valid attributes" do
    category = Category.new
    expect(category.save).to eq false

    category2 = Category.new(name: "12thing")
    expect(category2.save).to eq false

    category_a = Category.create(name: "thing")
    category_b = Category.create(name: "thing")
    expect(category_b.save).to eq false
  end

  it "gets the name into parameter format" do
    category = Category.create(name: "tHis thInG")
    expect(category.slug).to eq("this-thing")
  end

  it "uses the slug for the parameter" do
    category = Category.create(name: "tHis thInG")
    expect(category.to_param).to eq("this-thing")
  end

  it "overrides find method depending on input" do
    category = Category.create(name: "thing")
    expect(Category.find(category.id).name).to eq "thing"
    expect(Category.find("thing").name).to eq "thing"
  end
end
