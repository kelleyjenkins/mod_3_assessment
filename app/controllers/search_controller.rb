class SearchController < ApplicationController

  def index
    zip = params[:query]

    @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,city,distance,longName,phone&apiKey=zvkqfuc5vws6ytvedk2qwf4n")


    results = JSON.parse(response.body, symbolize_names: true)[:stores]

    @stores=  results.map do |result|
      Store.new(result)
    end

  end
end
