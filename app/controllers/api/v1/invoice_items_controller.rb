class Api::V1::InvoiceItemsController < ApplicationController

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  private

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
