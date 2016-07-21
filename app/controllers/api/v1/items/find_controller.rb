class Api::V1::Items::FindController < ApplicationController
  def show
    render json: Item.find_by(item_params)
  end

  def index
    render json: Item.where(item_params)
  end

  def random
    render json: Item.random
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :id, :created_at, :updated_at, :merchant_id)
  end
end
