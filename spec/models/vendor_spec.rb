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
  end
end
