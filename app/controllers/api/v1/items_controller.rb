class Api::V1::ItemsController < ApplicationController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(item_params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :id, :created_at, :updated_at, :merchant_id)
  end
end
