class Api::V1::ItemsController < ActionController::API

  def index
    render json: Item.all
  end
end
