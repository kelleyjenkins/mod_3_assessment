require 'rails_helper'

describe "BestBuyService" do
  subject {BestBuyService.new("80202")}

  it "exists" do
    expect(subject).to be_a BestBuyService
  end

  context "#find_stores" do
    it "returns stores as a hash" do
      store = subject.find_stores.first

      expect(subject.find_stores.count).to eq(10)
      expect(store).to be_a Hash
      expect(store).to have_key :longName
      expect(store[:longName]).to be_a String
    end
  end

  context "#total" do
    it "returns total number of stores" do
      store = subject.total

      expect(subject.total).to eq(17)
    end
  end
end
