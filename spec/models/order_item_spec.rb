require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context "relationships" do
    it { should belong_to(:order) }
    it { should belong_to(:item) }
    it { should belong_to(:vendor) }
  end
end
