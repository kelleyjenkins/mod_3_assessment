class StoreSearchService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def stores
    BestBuyService.new(@zip).find_stores.map do |store|
      Store.new(store)
    end
  end

  def find_total
    BestBuyService.new(@zip).total
  end
end
