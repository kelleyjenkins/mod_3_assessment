require 'rails_helper'

describe "Items API" do
  context "HTTP get request" do
    it "gets all items" do
      item1, item2, item3 = create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(items.count).to eq(3)

      expect(items.last[:id]).to eq(item3.id)
      expect(items.last[:name]).to eq(item3.name)
      expect(items.last[:description]).to eq(item3.description)
      expect(items.last[:image_url]).to eq(item3.image_url)
      expect(items.last[:created_at]).not_to be_present
    end
  end

  context "get request - single item"
    it "returns one item" do
      create(:item)

  end
end
