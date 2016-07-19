class Api::V1::Items::FindController < ApplicationController
  def show
    respond_with Item.find_by(item_params)
  end

  def index
    respond_with Item.where(item_params)
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :id, :created_at, :updated_at, :merchant_id)
  end

end
