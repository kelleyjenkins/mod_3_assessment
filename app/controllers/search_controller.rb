class SearchController < ApplicationController

  def index
    zip = params[:query]

    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,city,distance,longName,phone&apiKey=#{ENV['bestbuy_api_key']}")

    results = JSON.parse(response.body, symbolize_names: true)[:stores].map do |store|
      Store.new(store)
    end

  end
end
