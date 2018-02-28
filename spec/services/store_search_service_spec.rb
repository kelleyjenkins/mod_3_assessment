require 'rails_helper'

describe "StoreSearchService" do
  subject {StoreSearchService.new("80202")}

  it "exists" do
    expect(subject).to be_a StoreSearchService
  end

  context "#stores" do
    it "returns store objects" do
      store = subject.stores

      expect(store.count).to eq(10)
      expect(store).to be_a Array
      expect(store.first).to be_an Object
    end
  end
end
