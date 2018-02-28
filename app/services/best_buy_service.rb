class BestBuyService

  def initialize(zip)
    @zip = zip
  end

  def conn
    Faraday.new(url: "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_stores
    get_url("/v1/stores(area(#{@zip},25))?format=json&show=storeType,city,distance,longName,phone&pageSize=10&apiKey=#{ENV["bestbuy_api_key"]}")[:stores]
  end

  def total
    get_url("/v1/stores(area(#{@zip},25))?format=json&show=storeType,city,distance,longName,phone&pageSize=10&apiKey=#{ENV["bestbuy_api_key"]}")[:total]
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end
end
