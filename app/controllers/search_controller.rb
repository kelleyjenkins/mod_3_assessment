class SearchController < ApplicationController

  def index
    @storesearch = StoreSearchService.new(params[:query])
  end
end
