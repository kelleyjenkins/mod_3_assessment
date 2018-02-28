class StoreSearchService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def stores
    BestBuyService.new(@zip).find_stores
    # @conn = Faraday.new(url: "https://api.bestbuy.com") do |faraday|
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = @conn.get("/v1/stores(area(#{@zip},25))?format=json&show=storeType,city,distance,longName,phone&apiKey=#{ENV["bestbuy_api_key"]}")
    #
    # results = JSON.parse(response.body, symbolize_names: true)[:stores]
    #
    # results.map do |result|
    #   Store.new(result)
    # end

  end
end
