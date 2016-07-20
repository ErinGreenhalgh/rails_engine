class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def invoice_items
    render json: item.invoice_items
  end

  def merchant
    render json: item.merchant
  end

  private
  def item
    Item.find(params[:item_id])
  end

end
