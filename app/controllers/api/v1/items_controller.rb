class Api::V1::ItemsController < ApplicationController

  
  def show
    respond_with Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price)
  end
end
