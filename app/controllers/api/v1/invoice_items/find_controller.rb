class Api::V1::Items::FindController < ApplicationController
  def show
    respond_with InvoiceItem.find_by(item_params)
  end

  def index
    respond_with InvoiceItem.where(item_params)
  end

  private

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
