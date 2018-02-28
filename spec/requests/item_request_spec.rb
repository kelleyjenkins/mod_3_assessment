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

  context "get request - single item" do
    it "returns one item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(result[:id]).to eq(item.id)
      expect(result[:name]).to eq(item.name)
      expect(result[:description]).to eq(item.description)
      expect(result[:image_url]).to eq(item.image_url)
    end
  end

  context "HTTP DELETE" do
    it "deletes an item" do
      item = create(:item)

      expect(Item.count).to eq(1)
      delete "/api/v1/items/#{item.id}"

      expect(response).to be_success
      expect(Item.count).to eq(0)
    end
  end

  context "HTTP Create" do
    it "create an item" do
      item = create(:item)

      
    end
  end
end
