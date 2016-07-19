class Api::V1::Items::FindController < ApplicationController
  def show
    respond_with Item.find_by(item_params)
  end

  def index
    respond_with Item.where(item_params).find_each do |item|
      item
    end
  end

  

  private

  def item_params
    params.permit(:name, :description, :unit_price, :id, :created_at, :updated_at, :merchant_id)
  end

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
