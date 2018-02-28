class SearchController < ApplicationController

  def index
    zip = params[:zip]

    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV[bestbuy_api_key]}")

  end
end
