class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    respond_with InvoiceItem.find_by(invoice_items_params)
  end

  def index
    respond_with InvoiceItem.where(invoice_items_params).find_each do |item|
      item
    end
  end

  private

  def invoice_items_params
    params.permit(:item_id, :invoice_id, :quantity, :id, :created_at, :updated_at, :unit_price)
  end
end
