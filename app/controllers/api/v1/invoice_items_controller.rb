class Api::V1::InvoiceItemsController < ApplicationController

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(invoice_items_params[:id])
  end

  private

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
